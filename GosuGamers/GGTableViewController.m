//
//  GGTableViewController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 27/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGTableViewController.h"
#import "GGActivityLabel.h"

@interface GGTableViewController ()

@property (nonatomic, strong) UIView *overlayView;

@end

@implementation GGTableViewController

@synthesize overlayView = _overlayView;
@synthesize tableView = _tableView;

- (void)showActivityWithMessage:(NSString *)text {
    [self showActivityWithMessage:text
                            color:[UIColor blackColor]
           activityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

- (void)showActivityWithMessage:(NSString *)text
                          color:(UIColor *)color
         activityIndicatorStyle:(UIActivityIndicatorViewStyle)style {
    GGActivityLabel *loadingView = [[GGActivityLabel alloc] initWithStyle:style];
    loadingView.label.text = text;
    loadingView.label.textColor = color;
    [loadingView sizeToFit];
    loadingView.autoresizingMask =
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin;
    loadingView.frame = CGRectMake(floor((self.view.frame.size.width - loadingView.frame.size.width) / 2),
                                   floor((self.view.frame.size.height - loadingView.frame.size.height) / 2),
                                   loadingView.frame.size.width,
                                   loadingView.frame.size.height);
    
    [self showOverlayView:loadingView];
}

- (void)showMessage:(NSString *)text color:(UIColor *)color {
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.font = [UIFont boldSystemFontOfSize:14.0];
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = UITextAlignmentCenter;
    messageLabel.text = text;
    messageLabel.textColor = color;
    CGSize labelSize = [messageLabel.text sizeWithFont:messageLabel.font
                                     constrainedToSize:CGSizeMake(self.view.frame.size.width - 20, CGFLOAT_MAX)];
    
    messageLabel.frame = CGRectMake(floor((self.view.frame.size.width - labelSize.width) / 2),
                                    floor((self.view.frame.size.height - labelSize.height) / 2),
                                    labelSize.width,
                                    labelSize.height);
    messageLabel.autoresizingMask =
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin;
    
    [self showOverlayView:messageLabel];
}

- (void)showMessage:(NSString *)text {
    [self showMessage:text color:[UIColor blackColor]];
}

- (void)showOverlayView:(UIView *)view {
    [_overlayView removeFromSuperview];
    _overlayView = view;
    _overlayView.alpha = 0.0;
    [self.view addSubview:_overlayView];
    [UIView animateWithDuration:0.2 animations:^{
        _overlayView.alpha = 1.0;
        _tableView.alpha = 0.0;
    }];
}

- (void)hideOverlayView {
    [UIView animateWithDuration:0.2
                     animations:^{
                         _overlayView.alpha = 0.0;
                         _tableView.alpha = 1.0;
                     }
                     completion:^(BOOL finished){ [_overlayView removeFromSuperview]; }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

@end
