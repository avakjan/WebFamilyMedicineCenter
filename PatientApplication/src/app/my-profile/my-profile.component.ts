import { Component, OnInit } from '@angular/core';
import { UserStoreService } from '../services/user-store.service';
import { Patient } from '../models/patient';

@Component({
  selector: 'app-my-profile',
  templateUrl: './my-profile.component.html',
  styleUrl: './my-profile.component.css'
})
export class MyProfileComponent implements OnInit {
  
  user : Patient = new Patient();
  constructor( private userStore : UserStoreService) {}

  ngOnInit() {
    this.user = this.userStore.currentUser;
  }

}
