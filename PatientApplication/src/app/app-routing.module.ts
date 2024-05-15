import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { MainComponent } from './main/main.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { HomeLocationComponent } from './home-location/home-location.component';
import { DoctorSelectionComponent } from './doctor-selection/doctor-selection.component';
import { ContactsComponent } from './contacts/contacts.component';
import { UpcomingVisitsComponent } from './upcoming-visits/upcoming-visits.component';
import { MyProfileComponent } from './my-profile/my-profile.component';
import { HistoryComponent } from './history/history.component';
import { EditProfileComponent } from './edit-profile/edit-profile.component';

const routes: Routes = [
  { path: '', component: MainComponent},
  { path: 'log-in', component: LoginComponent }, 
  { path: 'sign-up', component: SignUpComponent},
  { path: 'home-location', component: HomeLocationComponent},
  { path: 'doctor-selection', component: DoctorSelectionComponent},
  { path: 'contacts', component: ContactsComponent},
  { path: 'upcoming-visits', component: UpcomingVisitsComponent},
  { path: 'my-profile', component: MyProfileComponent},
  { path: 'edit-profile', component: EditProfileComponent},
  { path: 'history', component: HistoryComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
