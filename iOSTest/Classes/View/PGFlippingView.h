//
//  PGFlippingView.h
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PGFlippingView;

typedef void (^PGFlippingViewCallback)(PGFlippingView *);


@interface PGFlippingView : UIView {
    
}

@property (strong, nonatomic) UIImage  *imageFront;
@property (strong, nonatomic) UIImage  *imageBack;
@property (copy, nonatomic)   NSString *text;
// events
@property (copy, nonatomic) PGFlippingViewCallback onClick;


#pragma mark - Animation

- (void)flip;

@end
