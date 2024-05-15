import { Component, OnInit } from '@angular/core';
import { PatientsClientService } from '../services/patients-client.service';
import { UserStoreService } from '../services/user-store.service';
import { UpcomingVisit } from '../models/upcomingVisit';

@Component({
  selector: 'app-upcoming-visits',
  templateUrl: './upcoming-visits.component.html',
  styleUrl: './upcoming-visits.component.css'
})
export class UpcomingVisitsComponent implements OnInit {

  upcomingVisits : UpcomingVisit[] = []

  constructor(private patientsHttp : PatientsClientService, private userStore : UserStoreService){ }

  ngOnInit() {
    const patientId = this.userStore.currentUser.systemId;
    this.patientsHttp.getUpcomingVisits(patientId).subscribe(r => {
       const result = r['value'] as UpcomingVisit[];
        result.forEach(e => {
          this.upcomingVisits.push(e as UpcomingVisit);
        });
    })
  }

}
