import { Component, OnInit } from '@angular/core';
import { CustomerOpinionReadListBetweenTwoDateService } from '../../../shared/services/customer-opinion-read-list-between-two-date.service'
import { NgForm } from '@angular/forms';
import { formatDate } from '@angular/common';

@Component({
  selector: 'app-customer-opinion-list-between-two-date-form',
  templateUrl: './customer-opinion-list-between-two-date-form.component.html',
  styleUrls: ['./customer-opinion-list-between-two-date-form.component.scss']
})
export class CustomerOpinionListBetweenTwoDateFormComponent implements OnInit {

  constructor(public serviceList: CustomerOpinionReadListBetweenTwoDateService) { }

  ngOnInit(): void {
  }

  onSubmit(formList: NgForm){
    console.log(formatDate(formList.value['dateStart'],'dd-MM-yyyy','en-US'));
    console.log(formatDate(formList.value['dateEnd'],'dd-MM-yyyy','en-US'));
    this.serviceList.getCustomerOpinionReadListBetweenTwoDate(
      formatDate(formList.value['dateStart'],'dd-MM-yyyy','en-US'),
      formatDate(formList.value['dateEnd'],'dd-MM-yyyy','en-US'));
    
  }
}
