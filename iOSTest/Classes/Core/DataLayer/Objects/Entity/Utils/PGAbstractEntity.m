//
//  PGAbstractEntity.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGAbstractEntity.h"


@implementation PGAbstractEntity

@synthesize uid = _uid;
@synthesize hash = _hash;


#pragma mark - Root

- (instancetype)init {
    self = [super init];
    if (self) {
        _uid = [[NSUUID UUID] UUIDString];
        _hash = [[NSUUID UUID] UUIDString]; // random value
    }
    return self;
}


#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PGAbstractEntity *entity = [[self.class allocWithZone:zone] init];
    // save UID
    _uid = [self.uid copy];
    _hash = [self.hash copy];
    
    return entity;
}


#pragma mark - Comparison

- (BOOL)isSameAs:(PGAbstractEntity *)entity {
    return ([entity isKindOfClass:PGAbstractEntity.class] // compare base classes
            && [entity.uid isEqualToString:self.uid]); // compare identities
}

- (BOOL)isEqualTo:(PGAbstractEntity *)entity {
    return ([self isSameAs:entity] // compare identities
            && [self.hash isEqualToString:entity.hash]); // compare hashes
}

@end
