//
//  PGFlippingView.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGFlippingView.h"

CGFloat const kPGFlippingViewFlipAnimationDuration = 1.0f;


@interface PGFlippingView () {
    BOOL isBackSide;
    BOOL isBusy;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel     *textLabel;


#pragma mark - Private

- (void)handleTap;

@end


@implementation PGFlippingView


#pragma mark - Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(handleTap)];
    [self addGestureRecognizer:tap];
}


#pragma mark - Animation

- (void)flip {
    if (isBusy) {
        return;
    }
    isBusy = YES;
    // no flag inversion until animation ends
    BOOL newHidden = (!isBackSide); // show label for front & hide for back side
    UIImage *newImage = (isBackSide) ? self.imageFront : self.imageBack; // choose image
    UIViewAnimationTransition transition = (isBackSide
                                            ? UIViewAnimationTransitionFlipFromLeft
                                            : UIViewAnimationTransitionFlipFromRight);
    // configure & perform animation
    [UIView beginAnimations:@"PGFlippingView.flip" context:NULL];
    [UIView setAnimationTransition:transition forView:self cache:NO];
    [UIView setAnimationDuration:kPGFlippingViewFlipAnimationDuration];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kPGFlippingViewFlipAnimationDuration * 0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.imageView.image = newImage;
        self.textLabel.hidden = newHidden;
    });
    [UIView commitAnimations];
    // invert flag
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kPGFlippingViewFlipAnimationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        isBackSide = !isBackSide;
        isBusy = NO;
    });
}


#pragma mark - Private

- (void)handleTap {
    if (self.onClick) {
        self.onClick(self);
    }
}


#pragma mark - Properties

- (void)setImageFront:(UIImage *)imageFront {
    _imageFront = imageFront;
    
    if (!isBackSide) {
        self.imageView.image = self.imageFront;
    }
}

- (void)setImageBack:(UIImage *)imageBack {
    _imageBack = imageBack;
    
    if (isBackSide) {
        self.imageView.image = self.imageBack;
    }
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    
    self.textLabel.text = self.text;
}

@end
