import {CustomerOpinion} from '../models/customer-opinion.model';
import { Injectable } from '@angular/core';
import {HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CustomerOpinionService {

  formData: CustomerOpinion = new CustomerOpinion();
  list: CustomerOpinion[];

  constructor(private http: HttpClient) { }

  postCustomerOpinion(){
    return this.http.post(`${environment.apiUrl}/CustomerOpinion`, this.formData);
  }

  putCustomerOpinion(){
    return this.http.put(`${environment.apiUrl}/CustomerOpinion/${this.formData.Id}`, this.formData);
  }

  deleteCustomerOpinion(id){
    return this.http.delete(`${environment.apiUrl}/CustomerOpinion/${id}`);
  }

  getOneCustomerOpinion(id){
    return this.http.get(`${environment.apiUrl}/CustomerOpinion/${id}`);
  }

  refreshList(){
    this.http.get(`${environment.apiUrl}/CustomerOpinion/`)
    .toPromise()
    .then(res => this.list = res as CustomerOpinion[]);
  }

}
