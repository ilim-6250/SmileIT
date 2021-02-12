import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { UserService } from '../../../shared/services/user.service';

@Component({
  selector: 'app-user-detail-form',
  templateUrl: './user-detail-form.component.html',
  styleUrls: ['./user-detail-form.component.scss']
})
export class UserDetailFormComponent implements OnInit {

  constructor(public service: UserService) { }

  ngOnInit(): void {
    this.resetForm();
  }

  resetForm (form?: NgForm) {
    if (form != null){
      form.form.reset();
    }
    else {
    this.service.formData = {
      Id: 0,
      Username: '',
      Email: '',
      Role: 0,
      Password: ''
      };
    }
  }

  onSubmit(form: NgForm) {
    this.service.formData.Role = +this.service.formData.Role;
    if (this.service.formData.Id === 0)
    {
      this.insertRecord(form);
    }
    else{
      this.updateRecord(form);
    }
  }

  updateRecord(form: NgForm) {
    this.service.putUser().subscribe(
      res => {
        this.resetForm(form);
        console.log('Submitted successfully', 'User Register');
        this.service.refreshList();
      },
      err => {
        console.log(err);
      }
    );
  }

  insertRecord(form: NgForm) {
    this.service.postUser().subscribe(
      res => {
        this.resetForm(form);
        this.service.refreshList();
      },
      err => { console.log(err); }
    );
  }

}
