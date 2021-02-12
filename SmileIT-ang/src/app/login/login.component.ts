import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthenticationService } from '../shared/services/authentication.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  constructor(public service: AuthenticationService, private router: Router) { }


  ngOnInit(): void {
    this.resetForm();
  }

  resetForm (form?: NgForm) {
    if (form != null){
      form.form.reset();
    }

    else {
    this.service.loginFormData = {
      Username: '',
      Password: ''
      };
    }
  }

  onSubmit(form: NgForm) {
      this.service.login().subscribe(
        res => {
          this.resetForm(form);
          console.log("logged in successfully!");
          this.router.navigate(['vote']);
        },
        err => { console.log(err); }
      );
  }
}
