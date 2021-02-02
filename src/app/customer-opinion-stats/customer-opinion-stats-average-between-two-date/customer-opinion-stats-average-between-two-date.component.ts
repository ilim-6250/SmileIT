import { Component, OnInit } from '@angular/core';
import { CustomerOpinionAverageBetweenTwoDateService } from 'src/app/shared/services/customer-opinion-average-between-two-date.service';

@Component({
  selector: 'app-customer-opinion-stats-average-between-two-date',
  templateUrl: './customer-opinion-stats-average-between-two-date.component.html',
  styleUrls: ['./customer-opinion-stats-average-between-two-date.component.scss']
})
export class CustomerOpinionStatsAverageBetweenTwoDateComponent implements OnInit {

  constructor(public serviceAvg : CustomerOpinionAverageBetweenTwoDateService) { }

  ngOnInit(): void {
  }

}
