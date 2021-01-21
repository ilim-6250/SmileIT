import { Injectable } from '@angular/core';
import { CustomerOpinionAverageBetweenTwoDate } from '../models/customer-opinion-average-between-two-date.model';
import {HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CustomerOpinionAverageBetweenTwoDateService {

  constructor(private http: HttpClient) { }

formData: CustomerOpinionAverageBetweenTwoDate = new CustomerOpinionAverageBetweenTwoDate();
readonly rootURL = "https://localhost:44356/api";
list: CustomerOpinionAverageBetweenTwoDate[];

getCustomerOpinionAverageBetweenTwoDate(dateStart,dateEnd){
  this.http.get(`${this.rootURL}/CustomerOpinion/${dateStart},${dateEnd}`)
  .toPromise()
  .then(res => this.list = res as CustomerOpinionAverageBetweenTwoDate[]);
}

}