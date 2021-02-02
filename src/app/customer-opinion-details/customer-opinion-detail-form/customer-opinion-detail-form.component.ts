import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { CustomerOpinionService } from '../../shared/services/customer-opinion.service';

@Component({
  selector: 'app-customer-opinion-detail-form',
  templateUrl: './customer-opinion-detail-form.component.html',
  styleUrls: ['./customer-opinion-detail-form.component.scss']
})
export class CustomerOpinionDetailFormComponent implements OnInit {

  constructor(public service: CustomerOpinionService) { }

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
      SmileyId: 0,
      Commentary: '',
      Created_at: null
      };
    }
  }

  onSubmit(form: NgForm) {
    this.service.formData.SmileyId = +this.service.formData.SmileyId;
    if (this.service.formData.Id === 0)
    {
      this.insertRecord(form);
    }
    else{
      this.updateRecord(form);
    }
  }

  updateRecord(form: NgForm) {
    this.service.putCustomerOpinion().subscribe(
      res => {
        this.resetForm(form);
        console.log('Submitted successfully', 'CustomerOpinion Register');
        this.service.refreshList();
      },
      err => {
        console.log(err);
      }
    );
  }

  insertRecord(form: NgForm) {
    //this.service.formData.Id = null;    
    //this.service.formData.SmileyId = +this.service.formData.SmileyId;
    this.service.postCustomerOpinion().subscribe(
      res => {
        this.resetForm(form);
        this.service.refreshList();
      },
      err => { console.log(err); }
    );
  }

}
