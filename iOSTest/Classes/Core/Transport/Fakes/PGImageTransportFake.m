//
//  PGImageTransportFake.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGImageTransportFake.h"

NSUInteger const kPGImageTransportFakeImagesCount = 5;


@interface PGImageTransportFake () {
    
}

@property (readonly, nonatomic) NSMutableArray<PGImageEntity *> *entities;

@end


@implementation PGImageTransportFake


#pragma mark - Root

- (instancetype)init {
    self = [super init];
    if (self) {
        _entities = [NSMutableArray new];
        
        for (NSInteger i = 0; i < kPGImageTransportFakeImagesCount; i++) {
            PGImageEntity *entity = [PGImageEntity new];
            entity.text = [NSString stringWithFormat:@"Котейка %ld", i];
            entity.imageName = [NSString stringWithFormat:@"cat%ld", i];
            
            [self.entities addObject:entity];
        }
    }
    return self;
}


#pragma mark - PGImageTransport

- (NSArray<PGAbstractEntity *> *)getAll {
    return self.entities;
}

- (PGAbstractEntity *)getWithUID:(NSString *)uid {
    for (PGImageEntity *entity in self.entities) {
        if ([entity.uid isEqualToString:uid]) {
            return entity;
        }
    }
    return nil;
}

@end
