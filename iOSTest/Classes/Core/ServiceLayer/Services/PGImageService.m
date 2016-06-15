//
//  PGImageService.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGImageService.h"
#import "PGImageParser.h"
//#import "PGImageTransport.h"
#import "PGImageTransportFake.h"


@implementation PGImageService


#pragma mark - Root

- (instancetype)init {
    self = [super init];
    if (self) {
        _cache = [PGAbstractCache new];
        _parser = [PGImageParser new];
//        _transport = [PGImageTransport new];
        _transport = [PGImageTransportFake new];
    }
    return self;
}


#pragma mark - Common

- (void)getAllImagesWithCompletion:(dispatch_block_t)completion {
    [self.cache updateEntities:[self.transport getAll]];
    
    if (completion) {
        completion();
    }
}

- (PGImageModel *)imageAtIndex:(NSUInteger)index {
    NSAssert(index < self.imagesCount, @"Index is out of bounds.");
    PGImageEntity *entity = (PGImageEntity *)self.cache.allEntities[index];
    
    return (PGImageModel *)[self.parser parseEntity:entity];
}


#pragma mark - Properties

- (NSUInteger)imagesCount {
    return self.cache.allEntities.count;
}

@end
