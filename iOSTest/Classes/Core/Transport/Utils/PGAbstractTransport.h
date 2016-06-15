//
//  PGAbstractTransport.h
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGAbstractEntity.h"


@interface PGAbstractTransport : NSObject {
    
}

#pragma mark - Common

- (NSArray<PGAbstractEntity *> *)getAll;
- (PGAbstractEntity *)getWithUID:(NSString *)uid;

@end
