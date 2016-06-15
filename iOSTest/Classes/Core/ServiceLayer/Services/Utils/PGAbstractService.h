//
//  PGAbstractService.h
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGAbstractCache.h"
#import "PGAbstractParser.h"
#import "PGAbstractTransport.h"


@interface PGAbstractService : NSObject {
    PGAbstractCache     *_cache;
    PGAbstractParser    *_parser;
    PGAbstractTransport *_transport;
}

@property (readonly, nonatomic) PGAbstractCache     *cache;
@property (readonly, nonatomic) PGAbstractParser    *parser;
@property (readonly, nonatomic) PGAbstractTransport *transport;

@end
