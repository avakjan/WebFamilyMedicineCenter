import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { ErrorMessagesService } from '../services/error-messages.service';
import { PatientsClientService } from '../services/patients-client.service';
import { UserStoreService } from '../services/user-store.service';

@Component({
  selector: 'app-edit-profile',
  templateUrl: './edit-profile.component.html',
  styleUrl: './edit-profile.component.css'
})
export class EditProfileComponent implements OnInit{
fieldCaptions = new Map<string, string>([ ['username', 'Username'], ['password', 'Password'], ['email', 'Email'], ['firstname', 'First name'], ['lastname', 'Last name'], ['phoneNumber', 'Phone number'] ]);
  patientForm =  new FormGroup({
    username : new FormControl('', [Validators.required, Validators.pattern('^[a-z A-Z 0-9]*$')]),
    password : new FormControl('', [Validators.required, Validators.maxLength(50)]),
    email: new FormControl('', [Validators.required, Validators.email]),
    firstname: new FormControl('', Validators.required),
    lastname: new FormControl('', Validators.required),
    phoneNumber: new FormControl('', [Validators.required, Validators.pattern('^[0-9]*$')])
  });
  errorMsg = '';

  get formFields() {
    return Object.keys(this.patientForm.controls);
  }

  constructor(public errorMessages : ErrorMessagesService, private patientsHttp : PatientsClientService, private userStore : UserStoreService) {}
  
  ngOnInit() {
    const patient = this.userStore.currentUser;
    this.patientForm.setValue({
      username: patient.username, 
      password: patient.password, 
      email: patient.email, 
      firstname: patient.firstname,
      lastname: patient.lastname,
      phoneNumber: patient.phoneNumber }
    );
  }
  
  onSubmit(){
    const patient = this.patientForm.value;
    const etag = this.userStore.currentUser.etag;
    const patientId = this.userStore.currentUser.systemId;
    this.patientsHttp
    .editUser(patient, patientId, etag)
    .subscribe({
      next: ans => this.userStore.logIn(ans), 
      error: _ => this.errorMsg = 'Username is already taken'
    });
  }
}
