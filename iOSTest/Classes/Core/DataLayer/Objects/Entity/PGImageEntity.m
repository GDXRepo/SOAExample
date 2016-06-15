//
//  PGImageEntity.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGImageEntity.h"


@implementation PGImageEntity


#pragma mark - PGAbstractEntity

- (id)copyWithZone:(NSZone *)zone {
    PGImageEntity *entity = [[self.class allocWithZone:zone] init];
    
    entity.imageName = self.imageName;
    entity.text = self.text;
    
    return entity;
}

@end
