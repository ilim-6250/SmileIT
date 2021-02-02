import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CustomerOpinionDetailsComponent } from './customer-opinion-details/customer-opinion-details.component';
import { VoteSmileyComponent } from './customer-opinion/vote-smiley/vote-smiley.component';
import { VoteThanksComponent } from './customer-opinion/vote-thanks/vote-thanks.component';
import { FourOhFourComponent } from './four-oh-four/four-oh-four.component';
import { FourOhOneComponent } from './four-oh-one/four-oh-one.component';
import { LoginComponent } from './login/login.component';
import {CustomerOpinionListComponent} from './customer-opinion-list/customer-opinion-list.component';
import { UserDetailsComponent } from './users/user-details/user-details.component';
import { AuthGuard } from './_helpers/auth-guard.model';
import { CustomerOpinionStatsComponent } from './customer-opinion-stats/customer-opinion-stats.component';

const routes: Routes = [
  {path: 'vote', component: VoteSmileyComponent},
  {path: 'thanks', component: VoteThanksComponent},
  { path: 'customerOpinionList', component: CustomerOpinionListComponent, canActivate: [AuthGuard]},
  { path: 'customerOpinionStats', component: CustomerOpinionStatsComponent, canActivate: [AuthGuard]},
  { path: 'customerOpinion', component: CustomerOpinionDetailsComponent, canActivate: [AuthGuard]},
  { path: 'user', component: UserDetailsComponent, canActivate: [AuthGuard]},
  { path: 'login', component: LoginComponent},
  { path: '', component: VoteSmileyComponent},
  { path: 'unauthorized', component: FourOhOneComponent },
  { path: 'not-found', component: FourOhFourComponent },
  { path: '**', redirectTo: 'not-found'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
