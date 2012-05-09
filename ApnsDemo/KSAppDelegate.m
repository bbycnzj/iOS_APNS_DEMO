//
//  KSAppDelegate.m
//  ApnsDemo
//
//  Created by Jinbo He on 12-5-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KSAppDelegate.h"

#import "KSViewController.h"

@implementation KSAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (void)showNotify:(NSDictionary *)userInfo
{
    NSString *body = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
    
    if (body !=nil && body.length >0) {        
        [_viewController showNotify:body];
    }
    
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[[KSViewController alloc] initWithNibName:@"KSViewController_iPhone" bundle:nil] autorelease];
    } else {
        self.viewController = [[[KSViewController alloc] initWithNibName:@"KSViewController_iPad" bundle:nil] autorelease];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes: UIRemoteNotificationTypeAlert | 
     UIRemoteNotificationTypeBadge | 
     UIRemoteNotificationTypeSound];
    
    [self applicationWillEnterForeground:application];
    
    return YES;
}

#pragma -
#pragma - [Push Notification]

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken { 
    
    NSString *deviceTokenStr = [NSString stringWithFormat:@"Device Token=%@", deviceToken];
    NSLog(@"%@", deviceTokenStr);
    
    deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@"Device-Token=<" withString:@""];
    deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@">" withString:@""];
    
    NSLog(@"%@", deviceTokenStr);
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error { 
    
    NSString *errorReason = [NSString stringWithFormat: @"Error: %@", [error description]];
    NSLog(@"%@", errorReason);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [self showNotify:userInfo];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
 
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
