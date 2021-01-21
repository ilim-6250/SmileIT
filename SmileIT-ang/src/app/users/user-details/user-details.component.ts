import { Component, OnInit } from '@angular/core';
import { UserService } from '../../shared/services/user.service';

@Component({
  selector: 'app-user-details',
  templateUrl: './user-details.component.html',
  styleUrls: ['./user-details.component.scss']
})
export class UserDetailsComponent implements OnInit {

  constructor(public service: UserService) { }

  ngOnInit(): void {
    this.service.refreshList();
  }

  populateForm(selectedRecord) {
    this.service.formData = Object.assign({}, selectedRecord);
  }

  onDelete(Id) {
    if (confirm('Are you sure you want to delete this record ?')) {
      this.service.deleteUser(Id)
        .subscribe(res => {
          this.service.refreshList();
        },
        err => { console.log(err); });
    }
  }

}
