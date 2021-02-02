import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomerOpinionStatsComponent } from './customer-opinion-stats.component';

describe('CustomerOpinionStatsComponent', () => {
  let component: CustomerOpinionStatsComponent;
  let fixture: ComponentFixture<CustomerOpinionStatsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CustomerOpinionStatsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomerOpinionStatsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
