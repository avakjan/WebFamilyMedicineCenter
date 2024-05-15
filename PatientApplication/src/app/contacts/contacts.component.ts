import { Component, OnInit } from '@angular/core';
import { PatientsClientService } from '../services/patients-client.service';
import { UserStoreService } from '../services/user-store.service';
import { MedicineCenter } from '../models/medicineCenter';
import { MedicalEmployee } from '../models/medicalEmployee';

@Component({
  selector: 'app-contacts',
  templateUrl: './contacts.component.html',
  styleUrl: './contacts.component.css'
})
export class ContactsComponent implements OnInit{
  medicineCenter = new MedicineCenter();
  doctors :  MedicalEmployee[] = [];
  nurses : MedicalEmployee[] = [];
  doctorNo = '';

  constructor(private patientsHttp : PatientsClientService, private userStore : UserStoreService){ }

  ngOnInit() {
    
    const centerId = this.userStore.currentUser.medicineCenterId;
    const centerNo = this.userStore.currentUser.medicineCenterNo;
    this.patientsHttp.getFamilyCenter(centerId).subscribe(r => this.medicineCenter = r as MedicineCenter);

    this.doctorNo = this.userStore.currentUser.doctorNo;

    this.patientsHttp.getCenterNurses(centerId).subscribe(r => this.nurses = r['value'] as MedicalEmployee[]);
    this.patientsHttp.getCenterDoctors(centerNo).subscribe(r => this.doctors = (r['value'] as MedicalEmployee[]).sort((a, _) => (a.no == this.doctorNo) ? -1 : 1));

  }

}
