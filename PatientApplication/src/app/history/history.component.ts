import { Component, OnInit } from '@angular/core';
import { PatientsClientService } from '../services/patients-client.service';
import { UserStoreService } from '../services/user-store.service';
import { PatientLedgerEntry } from '../models/patientLedgerEntry';

@Component({
  selector: 'app-history',
  templateUrl: './history.component.html',
  styleUrl: './history.component.css'
})
export class HistoryComponent implements OnInit {

  ledgerEntries : PatientLedgerEntry[] = []

  constructor(private patientsHttp : PatientsClientService, private userStore : UserStoreService){ }
  
  ngOnInit() {
    const patientId = this.userStore.currentUser.systemId;
    this.patientsHttp.getLedgerEntries(patientId).subscribe(r => {
      const result = r['value'] as PatientLedgerEntry[];
       result.forEach(e => {
         this.ledgerEntries.push(e as PatientLedgerEntry);
       });
   })
  }

}
