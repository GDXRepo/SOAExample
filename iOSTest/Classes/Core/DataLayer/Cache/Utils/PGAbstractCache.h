//
//  PGAbstractCache.h
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGAbstractEntity.h"


@interface PGAbstractCache : NSObject {
    NSMutableArray *_allEntitites;
}

@property (readonly, nonatomic) NSArray<PGAbstractEntity *> *allEntities;


#pragma mark - Access

- (void)updateEntities:(NSArray<PGAbstractEntity *> *)entities;
- (void)updateEntity:(PGAbstractEntity *)entity;
- (PGAbstractEntity *)entityWithUID:(NSString *)uid;

@end
