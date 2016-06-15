//
//  PGAbstractCache.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGAbstractCache.h"


@implementation PGAbstractCache

@synthesize allEntities = _allEntitites;


#pragma mark - Root

- (instancetype)init {
    self = [super init];
    if (self) {
        _allEntitites = [NSMutableArray new];
    }
    return self;
}


#pragma mark - Access

- (void)updateEntities:(NSArray<PGAbstractEntity *> *)entities {
    for (PGAbstractEntity *entity in entities) {
        [self updateEntity:entity];
    }
}

- (void)updateEntity:(PGAbstractEntity *)entity {
    NSArray<PGAbstractEntity *> *entities = self.allEntities; // get all entities
    PGAbstractEntity *entityNew = [entity copy]; // copy incoming entity
    BOOL isUpdated = NO;
    // search for the same entity
    for (NSInteger i = 0; i < entities.count; i++) {
        PGAbstractEntity *item = entities[i];
        
        if ([item isSameAs:entityNew]) {
            // replace data only if hashes differ from each other
            if (![item isEqualTo:entityNew]) {
                [_allEntitites replaceObjectAtIndex:i withObject:entityNew];
            }
            isUpdated = YES;
            
            break;
        }
    }
    // if no entity found then just add its copy to internal storage
    if (!isUpdated) {
        [_allEntitites addObject:entityNew];
    }
}

- (PGAbstractEntity *)entityWithUID:(NSString *)uid {
    for (PGAbstractEntity *entity in self.allEntities) {
        if ([entity.uid isEqualToString:uid]) {
            return entity;
        }
    }
    return nil;
}

@end
