import { Component, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { PatientsClientService } from '../services/patients-client.service';
import { Patient } from '../models/patient';
import { UserStoreService } from '../services/user-store.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent implements OnDestroy{
  public username = '';
  public password = '';
  public message = '';
  private subs: Subscription[] = []; 

  constructor(private patientsClient : PatientsClientService,
              private router : Router,
              private userStore : UserStoreService) {
  }
  
  onLogin() {
    if(this.username != '' && this.password != '') {
      this.subs.push(
        this.patientsClient
        .getUserByNameAndPass(this.username, this.password)
        .subscribe(data => {
          const patients = data['value'] as Patient[];
          if(patients.length == 0) this.message = 'Wrong username or password!';
          else {
            this.message = 'Correct!';
            this.userStore.logIn(patients[0]);
          }
        }));
    }
  }
  onSignup(){
    this.router.navigate(['/sign-up']);
  }

  ngOnDestroy(){
    this.subs.forEach(x => x.unsubscribe());
  }
}
