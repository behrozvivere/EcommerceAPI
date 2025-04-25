import { Controller, Get } from '@nestjs/common';
import { Public } from '@shared/decorators/public.decorator';

@Controller()
export class AppController {
  @Public()
  @Get()
  getHello() {
    return {
      name: 'Ecommerce API',
      version: '1.0.0',
      description: 'RESTful API for ecommerce application',
      documentation: '/docs',
      status: 'running'
    };
  }
}