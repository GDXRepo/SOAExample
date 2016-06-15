//
//  AppDelegate.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "AppDelegate.h"
#import "PGMainViewController.h"


@interface AppDelegate () {
    
}

@end


@implementation AppDelegate


#pragma mark - Lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIViewController *rootController = [[PGMainViewController alloc]
                                        initWithNibName:@"PGMainViewController"
                                        bundle:NSBundle.mainBundle];
    self.navController = [[UINavigationController alloc] initWithRootViewController:rootController];
    // init window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
