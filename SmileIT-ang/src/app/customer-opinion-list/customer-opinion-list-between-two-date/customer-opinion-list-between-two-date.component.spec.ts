import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomerOpinionListBetweenTwoDateComponent } from './customer-opinion-list-between-two-date.component';

describe('CustomerOpinionListBetweenTwoDateComponent', () => {
  let component: CustomerOpinionListBetweenTwoDateComponent;
  let fixture: ComponentFixture<CustomerOpinionListBetweenTwoDateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CustomerOpinionListBetweenTwoDateComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomerOpinionListBetweenTwoDateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
