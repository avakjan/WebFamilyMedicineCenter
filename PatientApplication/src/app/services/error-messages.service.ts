import { Injectable } from '@angular/core';

@Injectable({
    providedIn: 'root'
})
export class ErrorMessagesService {
    public readonly required = 'This field is required';
    public readonly numbersAndDigitsOnly = 'Please enter only numbers or digits';
    public readonly numbersOnly = 'Please enter only numbers';
    public readonly email = 'Please enter a valid email';
}