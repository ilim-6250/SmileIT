import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'numberToSmileyLogo'
})
export class NumberToSmileyLogoPipe implements PipeTransform {

  transform(value: number): string {
    switch(value) {
        case 1: {
            return "../../assets/images/smiley-red.png";
            break;
        }
        case 2: {
            return "../../assets/images/smiley-orange.png";
            break;
        }
        case 3: {
            return "../../assets/images/smiley-yellow.png";
            break;
        }
        case 4: {
            return "../../assets/images/smiley-lightGreen.png";
            break;
        }
        case 5: {
            return "../../assets/images/smiley-green.png";
            break;
        }
        default: {
            return value.toString();
            break;
        }
    }
    
  }
  
}
