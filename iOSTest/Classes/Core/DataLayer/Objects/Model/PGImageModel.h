//
//  PGImageModel.h
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGAbstractModel.h"


@interface PGImageModel : PGAbstractModel {
    
}

@property (copy, nonatomic) UIImage  *image;
@property (copy, nonatomic) NSString *imageName;
@property (copy, nonatomic) NSString *text;

@end
