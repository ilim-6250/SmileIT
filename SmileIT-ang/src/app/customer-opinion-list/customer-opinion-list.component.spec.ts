import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomerOpinionListComponent } from './customer-opinion-list.component';

describe('CustomerOpinionListComponent', () => {
  let component: CustomerOpinionListComponent;
  let fixture: ComponentFixture<CustomerOpinionListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CustomerOpinionListComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomerOpinionListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
