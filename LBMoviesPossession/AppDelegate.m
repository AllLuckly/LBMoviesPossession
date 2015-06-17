//
//  AppDelegate.m
//  LBMoviesPossession
//
//  Created by fhkj on 15/6/16.
//  Copyright (c) 2015年 Bison. All rights reserved.
//

#import "AppDelegate.h"

#import "LBMovies_VC.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    LBMovies_VC *vc = [[LBMovies_VC alloc]init];

    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nvc;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
