//
//  GGAppDelegate.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 22/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGAppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate> {
    NSDictionary *_receivedNotification;
}

@property (strong, nonatomic) UIWindow *window;

- (void)viewNotification:(NSDictionary *)notification;

@end
