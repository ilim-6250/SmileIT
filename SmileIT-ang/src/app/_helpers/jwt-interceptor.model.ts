import { Injectable } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor, HTTP_INTERCEPTORS } from '@angular/common/http';
import { Observable } from 'rxjs';


import { AuthenticationService } from '../shared/services/authentication.service';
import { stringify } from 'querystring';

const TOKEN_HEADER_KEY = 'Authorization';


@Injectable()
export class JwtInterceptor implements HttpInterceptor {

    
    constructor(private authenticationService: AuthenticationService) { }

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        // add authorization header with jwt token if available
        let authRequest = request;
        const token = this.authenticationService.getCurrentTokenValue();
        if (token != null) {
            authRequest = request.clone({   
                //headers: request.headers.set(TOKEN_HEADER_KEY, 'Bearer ' + token)             
                setHeaders: {
                    Authorization: `Bearer ${token}`
                }                   
            });        
            return next.handle(authRequest);
        }
        else{
            return next.handle(request);
        }
    }
}

export const authInterceptorProviders = [
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true }
  ];