//
//  PGMainViewController.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGMainViewController.h"
#import "PGServiceLayer.h"
#import "PGFlippingView.h"


@interface PGMainViewController () {
    
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


#pragma mark - Private

- (void)loadImages;

@end


@implementation PGMainViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"iOS Test";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadImages];
}


#pragma mark - Private

- (void)loadImages {
    PGImageService *service = [PGServiceLayer instance].imageService;
    
    [service getAllImagesWithCompletion:^{
        // remove old images
        for (UIView *view in self.scrollView.subviews) {
            [view removeFromSuperview];
        }
        // add new images
        NSUInteger imagesCount = service.imagesCount;
        for (NSInteger i = 0; i < imagesCount; i++) {
            PGFlippingView *view = [[NSBundle mainBundle] loadNibNamed:@"PGFlippingView"
                                                                 owner:self
                                                               options:nil][0];
            PGImageModel *imageFront = [service imageAtIndex:i];
            PGImageModel *imageBack = [service imageAtIndex:(imagesCount - i - 1)];
            view.imageFront = imageFront.image;
            view.imageBack = imageBack.image;
            view.text = imageFront.text;
            view.onClick = ^(PGFlippingView *view) {
                [view flip];
            };
            CGRect rect = self.scrollView.bounds;
            rect.origin.x = i * rect.size.width;
            rect.size.height -= 64;
            view.frame = rect;
            
            [self.scrollView addSubview:view];
            [self.scrollView setContentSize:CGSizeMake(view.frame.origin.x + view.frame.size.width, 0)];
        }
    }];
}

@end
