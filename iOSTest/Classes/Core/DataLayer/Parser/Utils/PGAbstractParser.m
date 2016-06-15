//
//  PGAbstractParser.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGAbstractParser.h"


@implementation PGAbstractParser


#pragma mark - Common

- (PGAbstractModel *)parseEntity:(id)entity {
    NSAssert([entity isKindOfClass:self.entityClass], @"Invalid entity class.");
    return nil;
}

- (PGAbstractEntity *)parseModel:(id)model {
    NSAssert([model isKindOfClass:self.modelClass], @"Invalid model class.");
    return nil;
}

@end
