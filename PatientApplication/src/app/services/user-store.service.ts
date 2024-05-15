import { Injectable } from '@angular/core';
import { Patient } from '../models/patient';
import { LocalStorage } from '../constants/localStorage';
import { TimeAssistant } from '../aids/timeAssistant';
import { Router } from '@angular/router';
import { PatientsClientService } from './patients-client.service';

@Injectable({
    providedIn: 'root'
})
export class UserStoreService {
    public currentUser = new Patient;

    constructor(private router : Router, private patientsClient : PatientsClientService){ }

    setUser(patient: any){
        Object.assign(this.currentUser, patient);
        this.currentUser.etag = patient['@odata.etag'];
        localStorage.setItem(LocalStorage.username, patient.username);
        localStorage.setItem(LocalStorage.expiration, TimeAssistant.addHours(new Date(), 1).toString());
        this.router.navigate(['/']);
    } 

    logIn(patient: any){
       this.setUser(patient);
       this.currentUser.locationEtag = patient['homeLocation']['@odata.etag'];
       if (this.currentUser.doctorNo){
        this.router.navigate(['/']);
       }
       else{
        this.router.navigate(['/home-location']);
       }
        
    } 

    signUp(patient: any){
        this.setUser(patient);
        this.router.navigate(['/home-location']);
    } 
    
    logOut() { 
        this.currentUser = new Patient(); 
        LocalStorage.clearPatientStorage();
        this.router.navigate(['/log-in']);
    }

    fetchUser() {
        const user = localStorage.getItem(LocalStorage.username);
        const exp = localStorage.getItem(LocalStorage.expiration);
        if (!user || !exp || TimeAssistant.isTimeExpired(exp)) this.logOut();
        else {
            this.patientsClient
            .fetchAuthenticatedUser(user)
            .subscribe(data => {
                const patients = data['value'] as Patient[];
                this.logIn(patients[0]);
            });
        }
    }
}





