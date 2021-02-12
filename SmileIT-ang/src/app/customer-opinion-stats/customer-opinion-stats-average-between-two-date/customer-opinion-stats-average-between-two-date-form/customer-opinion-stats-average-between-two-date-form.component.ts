import { Component, OnInit } from '@angular/core';
import { CustomerOpinionAverageBetweenTwoDateService } from '../../../shared/services/customer-opinion-average-between-two-date.service'
import { NgForm } from '@angular/forms';
import { formatDate } from '@angular/common';

@Component({
  selector: 'app-customer-opinion-stats-average-between-two-date-form',
  templateUrl: './customer-opinion-stats-average-between-two-date-form.component.html',
  styleUrls: ['./customer-opinion-stats-average-between-two-date-form.component.scss']
})
export class CustomerOpinionStatsAverageBetweenTwoDateFormComponent implements OnInit {

  constructor(public serviceAvg : CustomerOpinionAverageBetweenTwoDateService) { }

  haveDate : boolean;
  ngOnInit(): void {
    this.resetForm();
    //this.checkDates();
  }
  resetForm (formAvg?: NgForm) {
    if (formAvg != null){
      formAvg.form.reset();
    }
    else {
    this.serviceAvg.formData = {
      SmileyId: 0,
      NumberOfVote: 0,
      Percent: 0
      };
    }
  }
  // checkDates(formAvg?: NgForm){
  //   if(formAvg.value['dateStart'] == null && formAvg.value['dateEnd'] == null){
  //     console.log(formAvg.value['dateStart'])
  //     this.haveDate = false;
  //   }
  //   else{
  //     this.haveDate = true;
  //   }   
  // }

  onSubmit(formAvg: NgForm){
    console.log(formatDate(formAvg.value['dateStart'],'dd-MM-yyyy','en-US'));
    console.log(formatDate(formAvg.value['dateEnd'],'dd-MM-yyyy','en-US'));
    this.serviceAvg.getCustomerOpinionAverageBetweenTwoDate(
      formatDate(formAvg.value['dateStart'],'dd-MM-yyyy','en-US'),
      formatDate(formAvg.value['dateEnd'],'dd-MM-yyyy','en-US'));
    
  }
}
