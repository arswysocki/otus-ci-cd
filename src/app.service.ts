import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Привет Мир!';
  }
  getBye(): string {
    return 'Пока, Мир!';
  }
}
