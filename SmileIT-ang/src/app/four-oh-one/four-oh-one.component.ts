import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-four-oh-one',
  templateUrl: './four-oh-one.component.html',
  styleUrls: ['./four-oh-one.component.scss']
})
export class FourOhOneComponent implements OnInit {

  constructor(private router:Router) { }

  ngOnInit(): void {
  }
  goToVoteMenu() {
    this.router.navigate(['vote']);
  }
  goToLogin() {
    this.router.navigate(['login']);
  }

}
