//
//  GGTableViewController.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 27/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGViewController.h"

@interface GGTableViewController : GGViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readonly) IBOutlet UITableView *tableView;

- (void)showActivityWithMessage:(NSString *)text
                          color:(UIColor *)color
         activityIndicatorStyle:(UIActivityIndicatorViewStyle)style;
- (void)showActivityWithMessage:(NSString *)text;
- (void)showMessage:(NSString *)text color:(UIColor *)color;
- (void)showMessage:(NSString *)text;
- (void)showOverlayView:(UIView *)view;
- (void)hideOverlayView;

@end
