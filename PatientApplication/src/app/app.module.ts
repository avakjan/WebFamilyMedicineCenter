import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MainComponent } from './main/main.component';
import { HeaderComponent } from './header/header.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { HomeLocationComponent } from './home-location/home-location.component';
import { DoctorSelectionComponent } from './doctor-selection/doctor-selection.component';
import { ContactsComponent } from './contacts/contacts.component';
import { UpcomingVisitsComponent } from './upcoming-visits/upcoming-visits.component';
import { MyProfileComponent } from './my-profile/my-profile.component';
import { HistoryComponent } from './history/history.component';
import { EditProfileComponent } from './edit-profile/edit-profile.component';
import { CommonModule } from '@angular/common';
import { DatePipe } from '@angular/common';


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    MainComponent,
    HeaderComponent,
    SignUpComponent,
    HomeLocationComponent,
    DoctorSelectionComponent,
    ContactsComponent,
    UpcomingVisitsComponent,
    MyProfileComponent,
    HistoryComponent,
    EditProfileComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    CommonModule
  ],
  providers: [
    [DatePipe],
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
