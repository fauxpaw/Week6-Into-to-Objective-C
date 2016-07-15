//
//  AppDelegate.m
//  lab#3
//
//  Created by Michael Sweeney on 7/13/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "AppDelegate.h"
#import "Store.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[Store shared] save];
}


-(void)applicationDidBecomeActive:(UIApplication *)application{
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    //TODO:
    UIViewController *viewController = (UIViewController *)navigationController.topViewController;
    [viewController ];
}
@end
