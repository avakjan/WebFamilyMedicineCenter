import { Component, OnInit } from '@angular/core';
import { UserStoreService } from './services/user-store.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit {
  title = 'PatientApplication';
  constructor(private userStore : UserStoreService){}
  ngOnInit(): void {
    this.userStore.fetchUser();
  }
}
