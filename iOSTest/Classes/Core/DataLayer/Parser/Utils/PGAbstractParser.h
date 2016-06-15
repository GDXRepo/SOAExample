//
//  PGAbstractParser.h
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGAbstractEntity.h"
#import "PGAbstractModel.h"


@interface PGAbstractParser : NSObject {
    
}

@property (readonly, nonatomic) Class entityClass;
@property (readonly, nonatomic) Class modelClass;


#pragma mark - Common

- (PGAbstractModel *)parseEntity:(id)entity;
- (PGAbstractEntity *)parseModel:(id)model;

@end
