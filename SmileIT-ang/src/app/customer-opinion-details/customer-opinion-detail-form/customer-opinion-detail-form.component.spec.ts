import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomerOpinionDetailFormComponent } from './customer-opinion-detail-form.component';

describe('CustomerOpinionDetailFormComponent', () => {
  let component: CustomerOpinionDetailFormComponent;
  let fixture: ComponentFixture<CustomerOpinionDetailFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CustomerOpinionDetailFormComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomerOpinionDetailFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
