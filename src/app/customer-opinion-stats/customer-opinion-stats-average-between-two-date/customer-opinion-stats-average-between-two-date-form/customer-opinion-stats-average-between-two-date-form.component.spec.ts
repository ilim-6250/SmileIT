import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomerOpinionStatsAverageBetweenTwoDateFormComponent } from './customer-opinion-stats-average-between-two-date-form.component';

describe('CustomerOpinionStatsAverageBetweenTwoDateFormComponent', () => {
  let component: CustomerOpinionStatsAverageBetweenTwoDateFormComponent;
  let fixture: ComponentFixture<CustomerOpinionStatsAverageBetweenTwoDateFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CustomerOpinionStatsAverageBetweenTwoDateFormComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomerOpinionStatsAverageBetweenTwoDateFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
