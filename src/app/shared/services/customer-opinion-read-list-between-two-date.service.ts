import { Injectable } from '@angular/core';
import {HttpClient } from '@angular/common/http';
import { CustomerOpinionReadListBetweenTwoDate } from '../models/customer-opinion-read-list-between-two-date.model';


@Injectable({
  providedIn: 'root'
})
export class CustomerOpinionReadListBetweenTwoDateService {

  constructor(private http: HttpClient) { }

  readonly rootURL = "https://localhost:44356/api"
  formData: CustomerOpinionReadListBetweenTwoDate = new CustomerOpinionReadListBetweenTwoDate();
  list: CustomerOpinionReadListBetweenTwoDate[];

  getCustomerOpinionReadListBetweenTwoDate(dateStart,dateEnd){
    this.http.get(`${this.rootURL}/CustomerOpinion/listBetweenTwoDate/${dateStart},${dateEnd}`)
    .toPromise()
    .then(r => this.list = r as CustomerOpinionReadListBetweenTwoDate[])
  }
}
