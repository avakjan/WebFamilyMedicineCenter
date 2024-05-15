import { Component, OnDestroy } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ErrorMessagesService } from '../services/error-messages.service';
import { PatientsClientService } from '../services/patients-client.service';
import { Subscription } from 'rxjs';
import { UserStoreService } from '../services/user-store.service';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrl: './sign-up.component.css'
})
export class SignUpComponent implements OnDestroy {

  patientForm =  new FormGroup({
    username : new FormControl('', [Validators.required, Validators.pattern('^[a-z A-Z 0-9]*$')]),
    password : new FormControl('', [Validators.required, Validators.maxLength(50)]),
    email: new FormControl('', [Validators.required, Validators.email]),
    firstname: new FormControl('', Validators.required),
    lastname: new FormControl('', Validators.required),
    phoneNumber: new FormControl('', [Validators.required, Validators.pattern('^[0-9]*$')])
  });
  private subs: Subscription[] = [];

  get formFields() {
    return Object.keys(this.patientForm.controls);
  }

  constructor(public errorMessages : ErrorMessagesService, private patientsHttp : PatientsClientService, private userStore : UserStoreService) {}
  
  onSubmit(){
    if (this.patientForm.invalid) return;
    const patient = this.patientForm.value;
    this.subs.push(this.patientsHttp.signupUser(patient).subscribe(ans => this.userStore.signUp(ans)));
  }

  ngOnDestroy(){
    this.subs.forEach(x => x.unsubscribe());
  }

}
