import { Component, OnInit } from '@angular/core';
import { UserStoreService } from '../services/user-store.service';
import { PatientsClientService } from '../services/patients-client.service';
import { MedicalEmployee } from '../models/medicalEmployee';
import { Router } from '@angular/router';

@Component({
  selector: 'app-doctor-selection',
  templateUrl: './doctor-selection.component.html',
  styleUrl: './doctor-selection.component.css'
})
export class DoctorSelectionComponent implements OnInit {
  familyCenterName ='';
  familyCenterNo ='';
  doctorsList : MedicalEmployee[] = [];
  selectedDoctorNo: string | null = null;

  constructor(private userStore : UserStoreService, private patientsHttp: PatientsClientService, private router : Router){}

  selectDoctor(doctorNo: string) {
    this.selectedDoctorNo = doctorNo;
  }

  onSubmit(){
    if(this.selectedDoctorNo != null){
      const etag = this.userStore.currentUser.etag;
      const patientId = this.userStore.currentUser.systemId;
      this.patientsHttp
            .setPatientDoctor(patientId, etag, this.selectedDoctorNo)
            .subscribe(_ => {this.router.navigate(['/']); this.userStore.currentUser.doctorNo = this.selectedDoctorNo!;});
    }
  }

  ngOnInit() {
    const locationid = this.userStore.currentUser.locationId;
    this.patientsHttp.getLocation(locationid).subscribe(r => {
      this.familyCenterName = r['closestFamilyCenterName'];
      this.familyCenterNo = r['closestFamilyCenterNo'];
      this.patientsHttp.getCenterDoctors(this.familyCenterNo)
                       .subscribe(d => this.doctorsList = d['value'] as MedicalEmployee[]);
    });
  }

}
