import { Controller, Delete, Get, Post, Put } from '@nestjs/common';
import { PostsService } from './posts.service';

@Controller('posts')
export class PostsController {
  constructor(private readonly postService: PostsService) {}

  @Get()
  findAll(): string {
    return 'this action return all posts';
  }

  @Post()
  create(): string {
    return 'this action create a new posts';
  }

  @Put()
  update(): string {
    return 'this action update a posts by id';
  }

  @Delete()
  destroy(): string {
    return 'this action delete a posts by id';
  }

  @Get()
  findById(): string {
    return 'this action return posts by id';
  }
}
