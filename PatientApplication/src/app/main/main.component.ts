import { Component } from '@angular/core';
import { UserStoreService } from '../services/user-store.service';
import { Patient } from '../models/patient';
import { HeaderComponent } from '../header/header.component';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrl: './main.component.css'
})
export class MainComponent {
  public user : Patient
  constructor(public userStore : UserStoreService){
    this.user = userStore.currentUser;
  }

}
