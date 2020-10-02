//
//  AppDelegate.m
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "AppDelegate.h"
#import "CUSTabViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:[CUSTabViewController new]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"-------applicationWillResignActive");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"------applicationDidBecomeActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"-----applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"-----applicationWillEnterForeground");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"----applicationWillTerminate");
}


@end
