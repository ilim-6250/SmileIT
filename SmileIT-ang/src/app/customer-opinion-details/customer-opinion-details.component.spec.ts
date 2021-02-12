import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomerOpinionDetailsComponent } from './customer-opinion-details.component';

describe('CustomerOpinionDetailsComponent', () => {
  let component: CustomerOpinionDetailsComponent;
  let fixture: ComponentFixture<CustomerOpinionDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CustomerOpinionDetailsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomerOpinionDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
