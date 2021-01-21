import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../models/user.model';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class UserService {


  formData: User = new User();
  list: User[];

  constructor(private http: HttpClient) { }

  postUser(){
    return this.http.post(`${environment.apiUrl}/User`, this.formData);
  }

  putUser(){
    return this.http.put(`${environment.apiUrl}/User/${this.formData.Id}`, this.formData);
  }

  deleteUser(id){
    return this.http.delete(`${environment.apiUrl}/User/${id}`);
  }

  getOneUser(id){
    return this.http.get(`${environment.apiUrl}/User/${id}`);
  }

  getAll() {
    return this.http.get<User[]>(`${environment.apiUrl}/users`);
}

  refreshList(){
    this.http.get(`${environment.apiUrl}/User/`)
    .toPromise()
    .then(res => this.list = res as User[]);
  }

}
