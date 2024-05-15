import { Injectable } from "@angular/core";

@Injectable({
    providedIn: 'root'
})
export class CountriesService {
    public readonly countries = ['Estonia', 'Latvia', 'Lithuania'];
}