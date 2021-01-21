import { Component, OnInit } from '@angular/core';
import { CustomerOpinionReadListBetweenTwoDateService } from 'src/app/shared/services/customer-opinion-read-list-between-two-date.service';

@Component({
  selector: 'app-customer-opinion-list-between-two-date',
  templateUrl: './customer-opinion-list-between-two-date.component.html',
  styleUrls: ['./customer-opinion-list-between-two-date.component.scss']
})
export class CustomerOpinionListBetweenTwoDateComponent implements OnInit {

  constructor(public serviceList : CustomerOpinionReadListBetweenTwoDateService) { }

  ngOnInit(): void {
  }

}
