import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VoteSmileyComponent } from './vote-smiley.component';

describe('VoteSmileyComponent', () => {
  let component: VoteSmileyComponent;
  let fixture: ComponentFixture<VoteSmileyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VoteSmileyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(VoteSmileyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
