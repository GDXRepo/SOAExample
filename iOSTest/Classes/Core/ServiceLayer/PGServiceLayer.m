//
//  PGServiceLayer.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGServiceLayer.h"


@implementation PGServiceLayer


#pragma mark - Root

- (instancetype)init {
    NSAssert(0, @"Use 'instance' instead."); // protects from "new" calls
    return nil;
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _imageService = [PGImageService new];
    }
    return self;
}

+ (instancetype)instance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self.class alloc] initPrivate];
    });
    return instance;
}

@end
