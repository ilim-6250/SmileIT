import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomerOpinionListBetweenTwoDateFormComponent } from './customer-opinion-list-between-two-date-form.component';

describe('CustomerOpinionListBetweenTwoDateFormComponent', () => {
  let component: CustomerOpinionListBetweenTwoDateFormComponent;
  let fixture: ComponentFixture<CustomerOpinionListBetweenTwoDateFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CustomerOpinionListBetweenTwoDateFormComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomerOpinionListBetweenTwoDateFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
