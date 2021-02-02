import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomerOpinionStatsAverageBetweenTwoDateComponent } from './customer-opinion-stats-average-between-two-date.component';

describe('CustomerOpinionStatsAverageBetweenTwoDateComponent', () => {
  let component: CustomerOpinionStatsAverageBetweenTwoDateComponent;
  let fixture: ComponentFixture<CustomerOpinionStatsAverageBetweenTwoDateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CustomerOpinionStatsAverageBetweenTwoDateComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomerOpinionStatsAverageBetweenTwoDateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
