//
//  GGAppDelegate.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 22/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGAppDelegate.h"
#import "Parse/Parse.h"

@implementation GGAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /* Parse Configuration */
    
    [Parse setApplicationId:@"1LRW5L2C4f1bBe9glvo38jZ8Sp3k6zVlzfSTUjky" clientKey:@"NxXxGaLu5qqsJ8Y9eM4n7jOow1pXwxkKnGQZfjH3"];
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|
     UIRemoteNotificationTypeAlert|
     UIRemoteNotificationTypeSound];
    
    /* RestKit configuration */
    
    [RKObjectManager objectManagerWithBaseURL:@"http://gosugamers-api.heroku.com"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'+01:00'"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [RKObjectMapping addDefaultDateFormatter:formatter]; 
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [RKObjectMapping addDefaultDateFormatter:formatter]; 
    
    /* Appearance configuration */
    
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0/255.0
                                                                        green:100/255.0
                                                                         blue:113/255.0
                                                                        alpha:1]];

    NSDictionary *notification = [launchOptions valueForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    
    if(notification) {
        [self viewNotification:notification];
    }
    
    application.applicationIconBadgeNumber = 0;
    
    return YES;
}

- (void)viewNotification:(NSDictionary *)notification {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[notification valueForKey:@"url"]]];
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken
{
    [PFPush storeDeviceToken:newDeviceToken];
}

- (void)application:(UIApplication *)application 
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    _receivedNotification = userInfo;
    
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:appName
                                                        message:[[_receivedNotification valueForKey:@"aps"] valueForKey:@"alert"]
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:@"View", nil];
    [alertView show];
    
    application.applicationIconBadgeNumber--;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == alertView.firstOtherButtonIndex) {
        [self viewNotification:_receivedNotification];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
