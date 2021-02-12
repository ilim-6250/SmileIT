import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { User } from '../models/user.model';
import { environment } from 'src/environments/environment';
import { UserLogin } from '../models/user-login.model';
import { StringifyOptions } from 'querystring';

@Injectable({ providedIn: 'root' })
export class AuthenticationService {
    loginFormData: UserLogin = new UserLogin();

    constructor(private http: HttpClient) { }

    

    login() {
        return this.http.post<any>(`${environment.apiUrl}/Auth/Login`, this.loginFormData)
            .pipe(map(response => {
                const token = (response as any).Token
                localStorage.setItem('jwtToken', token);
            }));
    }

    
    getCurrentTokenValue(){
        return localStorage.getItem('jwtToken');
    }
    
    isLoggedIn(){
        if(localStorage.getItem('jwtToken') != null){
            return true;
        }
        else{
            return false;
        }
    }

    isLoggedOut(){
        return !this.isLoggedIn();
    }

    logout() {
        // remove user from local storage to log user out
        localStorage.removeItem('jwtToken');
    }
}