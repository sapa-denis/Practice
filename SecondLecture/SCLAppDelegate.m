//
//  SCLAppDelegate.m
//  SecondLecture
//
//  Created by Sapa Denys on 17.06.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import "SCLAppDelegate.h"
#import "SCLDataProvider+SCLFileUtils.h"

@implementation SCLAppDelegate

+ (SCLAppDelegate *)appDelegate
{
	return [[UIApplication sharedApplication] delegate];
}

- (SCLDataProvider *)dataProvider
{
	if (!_dataProvider) {
		_dataProvider = [SCLDataProvider testDataProvider];
	}
	return _dataProvider;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
