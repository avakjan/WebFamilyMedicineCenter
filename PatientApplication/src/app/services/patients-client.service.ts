import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class PatientsClientService{
    private static readonly bcUrl = 'https://itb2204.bc365.eu:7048/bc/api/student/veebiarstikeskus/v2.0/companies(34f95556-b4bd-ee11-907c-6045bdc8dfac)';
    private readonly patientsUrlWithLocation = PatientsClientService.bcUrl + '/patients? $expand=homeLocation &tenant=VeebiArstiKeskus';
    private readonly patientsPostUrl = PatientsClientService.bcUrl + '/patients?tenant=VeebiArstiKeskus';
    private readonly patientUrl= PatientsClientService.bcUrl + '/patients(%1)?tenant=VeebiArstiKeskus';
    private readonly authURl = PatientsClientService.bcUrl + "/patients? $expand=homeLocation & $filter= password eq '%1' and username eq '%2'&tenant=VeebiArstiKeskus";
    private readonly authFetchURl = PatientsClientService.bcUrl + "/patients? $expand=homeLocation & $filter= username eq '%1' &tenant=VeebiArstiKeskus";
    private readonly locationUrl = PatientsClientService.bcUrl + "/homeLocations(%1)?tenant=VeebiArstiKeskus";    
    private readonly doctorsListUrl = PatientsClientService.bcUrl + "/MedicalEmployees?$filter=role eq 'Doctor' and familyMedicineCenterNo eq '%1' &tenant=VeebiArstiKeskus";
    private readonly visitsUrl = PatientsClientService.bcUrl + "/upcomingVisits?$filter = patientId eq %1 &tenant=VeebiArstiKeskus";
    private readonly ledgerEntriesUrl = PatientsClientService.bcUrl + "/patientLedgerEntries?$filter = patientId eq %1 &tenant=VeebiArstiKeskus";
    private readonly familyCenterUrl = PatientsClientService.bcUrl + "/familyCenters(%1)?$expand=medicineCenterLocation &tenant=VeebiArstiKeskus";
    private readonly medicalEmployeeUrl = PatientsClientService.bcUrl + "/medicalEmployees(%1)?tenant=VeebiArstiKeskus";
    private readonly nursesUrl = PatientsClientService.bcUrl + "/medicalEmployees?$filter = role eq 'Nurse' and familyMedicineCenterId eq %1 &tenant=VeebiArstiKeskus";
    
    constructor(private http: HttpClient) { }

    signupUser(user : any){
        return this.http.post<any>(this.patientsPostUrl, user, this.getAuthOptions());
    }

    fetchAuthenticatedUser(login: string) : Observable<any> {
        let url =  this.authFetchURl;
        url = url.replace("%1", login);
        return this.http.get<any>(url, this.getAuthOptions());
    }

    editUser(user : any, patientId : string, patientEtag : string){
        const url = this.patientUrl.replace("%1", patientId);
        const options = this.getAuthOptions();
        options.headers = options.headers.set('If-Match', patientEtag);
        return this.http.patch<any>(url, user, options);
    }

    setPatientDoctor(patientId: string, patientEtag: string, doctorNo: string) {
        const url = this.patientUrl.replace("%1", patientId);
        const body = {doctorNo};
        const options = this.getAuthOptions();
        options.headers = options.headers.set('If-Match', patientEtag);
        return this.http.patch<any>(url, body, options);
    }

    updateLocation(locationId: string, countryRegion : string, adminDistrict : string, address: string, locationEtag : string){
        const location = {countryRegion, adminDistrict, address};
        let url = this.locationUrl;
        url = url.replace("%1", locationId);
        const options = this.getAuthOptions();
        options.headers = options.headers.set('If-Match', locationEtag);
        return this.http.patch<any>(url, location, options );
    }

    getUserByNameAndPass(login: string, password: string) : Observable<any> {
        let url = this.authURl;
        url = url.replace("%1", password);
        url = url.replace("%2", login);
        return this.http.get<any>(url, this.getAuthOptions());
    }

    getLocation(locationId: string){
        const url = this.locationUrl.replace("%1", locationId);
        return this.http.get<any>(url, this.getAuthOptions());
    }

    getPatients(): Observable<any> {
        return this.http.get<any>(this.patientsUrlWithLocation, this.getAuthOptions());
    }
    
    getUpcomingVisits(patientId : string){
        const url = this.visitsUrl.replace("%1", patientId);
        return this.http.get<any>(url, this.getAuthOptions());
    }

    getLedgerEntries(patientId : string){
        const url = this.ledgerEntriesUrl.replace("%1", patientId);
        return this.http.get<any>(url, this.getAuthOptions());
    }

    getFamilyCenter(centerId: string){
        const url = this.familyCenterUrl.replace("%1", centerId);
        return this.http.get<any>(url, this.getAuthOptions());
    }

    getMedicalEmployee(employeeId: string){
        const url = this.medicalEmployeeUrl.replace("%1", employeeId);
        return this.http.get<any>(url, this.getAuthOptions());
    }

    getCenterDoctors(centerNo: string){
        const url = this.doctorsListUrl.replace("%1", centerNo);
        return this.http.get<any>(url, this.getAuthOptions());
    }

    getCenterNurses(centerId : string){
        const url = this.nursesUrl.replace("%1", centerId);
        return this.http.get<any>(url, this.getAuthOptions());
    }

    private getAuthOptions(){
        let headers_object = new HttpHeaders();
        headers_object = headers_object.set('Content-Type', 'application/json');
        headers_object = headers_object.set("Authorization", "Basic " + btoa("dmdere:ITB2204k2x!"));
        return { headers: headers_object };
    }
}