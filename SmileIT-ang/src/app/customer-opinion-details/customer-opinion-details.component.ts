import { Component, OnInit } from '@angular/core';
import { CustomerOpinionService } from '../shared/services/customer-opinion.service';
//import { NumberToSmileyLogoPipe } from '../pipes/number-to-smiley-logo.pipe';


@Component({
  selector: 'app-customer-opinion-details',
  templateUrl: './customer-opinion-details.component.html',
  styleUrls: ['./customer-opinion-details.component.scss']
})
export class CustomerOpinionDetailsComponent implements OnInit {

  constructor(public service: CustomerOpinionService) { }


  ngOnInit(): void {
    this.service.refreshList();
  }  

  populateForm(selectedRecord) {
    this.service.formData = Object.assign({}, selectedRecord);
  }

  onDelete(Id) {
    if (confirm('Are you sure you want to delete this record ?')) {
      this.service.deleteCustomerOpinion(Id)
        .subscribe(res => {
          this.service.refreshList();
        },
        err => { console.log(err); });
    }
  }

}
