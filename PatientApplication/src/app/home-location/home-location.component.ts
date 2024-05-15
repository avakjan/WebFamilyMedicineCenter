import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { UserStoreService } from '../services/user-store.service';
import { ErrorMessagesService } from '../services/error-messages.service';
import { CountriesService } from '../services/countries.service';
import { PatientsClientService } from '../services/patients-client.service';
import { Subscription } from 'rxjs';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home-location',
  templateUrl: './home-location.component.html',
  styleUrl: './home-location.component.css'
})
export class HomeLocationComponent {
  private subs : Subscription[] = []
  homeLocationForm =  new FormGroup({
    country : new FormControl('', [Validators.required]),
    adminDistrict : new FormControl('', [Validators.required]),
    homeAddress: new FormControl('', Validators.required)
  });

  constructor(public userStore : UserStoreService, public errorMessages : ErrorMessagesService, public countries : CountriesService, private patientsService : PatientsClientService, private router : Router){ }

  onSubmit(){
    if (this.homeLocationForm.invalid) return;
    const locationid = this.userStore.currentUser.locationId;
    let locationEtag = '';
    const formValue = this.homeLocationForm.value;
    this.subs.push(this.patientsService.getLocation(locationid).subscribe(r => {
      locationEtag = r['@odata.etag'];
      this.subs.push(this.patientsService
               .updateLocation(locationid, formValue.country!, formValue.adminDistrict!, formValue.homeAddress!, locationEtag)
               .subscribe(_ => this.router.navigate(['/doctor-selection']))
              );
      }
    ));

  }


}
