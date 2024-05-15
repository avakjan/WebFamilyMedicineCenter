import { Component } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import { filter } from 'rxjs';
import { UserStoreService } from '../services/user-store.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrl: './header.component.css'
})
export class HeaderComponent {
  public currentUrl = '';
  constructor(private router: Router, public userStore: UserStoreService) {
    this.router.events.pipe(
      filter(event => event instanceof NavigationEnd)  
    ).subscribe((event: any) => {
      this.currentUrl = event.urlAfterRedirects;
    });
  }
  logOut(){
    this.userStore.logOut();
    this.router.navigate(['/']);
  }
}
