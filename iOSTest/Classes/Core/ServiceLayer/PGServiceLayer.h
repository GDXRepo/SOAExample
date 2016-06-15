//
//  PGServiceLayer.h
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGImageService.h"


@interface PGServiceLayer : NSObject {
    
}

@property (readonly, nonatomic) PGImageService *imageService;


#pragma mark - Root

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)instance;

@end
