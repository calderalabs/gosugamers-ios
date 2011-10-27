//
//  GGManageChannelsController.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 27/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGTableViewController.h"

@class GGChannelsController;

@protocol GGChannelsControllerDelegate <NSObject>

@optional
- (void)channelsControllerDidCancel:(GGChannelsController *)controller;

@end

@interface GGChannelsController : GGTableViewController

@property (nonatomic, weak) id<GGChannelsControllerDelegate> delegate;
@property (nonatomic, strong, readonly) NSSet *channels;

- (IBAction)cancel:(id)sender;

@end
