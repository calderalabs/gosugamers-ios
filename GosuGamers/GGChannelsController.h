//
//  GGManageChannelsController.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 27/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGTableViewController.h"
#import "GGSwitchTableViewCell.h"

@class GGChannelsController;

@protocol GGChannelsControllerDelegate <NSObject>

@optional
- (void)channelsControllerDidCancel:(GGChannelsController *)controller;

@end

@interface GGChannelsController : GGTableViewController <GGSwitchTableViewCellDelegate> {
    NSMutableSet *_channels;
}

@property (nonatomic, weak) id<GGChannelsControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;

@end
