import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VoteThanksComponent } from './vote-thanks.component';

describe('VoteThanksComponent', () => {
  let component: VoteThanksComponent;
  let fixture: ComponentFixture<VoteThanksComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VoteThanksComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(VoteThanksComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
