//
//  PGImageService.h
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGAbstractService.h"
#import "PGImageModel.h"


@interface PGImageService : PGAbstractService {
    
}

@property (readonly, nonatomic) NSUInteger imagesCount;


#pragma mark - Common

- (void)getAllImagesWithCompletion:(dispatch_block_t)completion;
- (PGImageModel *)imageAtIndex:(NSUInteger)index;

@end
