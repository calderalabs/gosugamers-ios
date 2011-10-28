//
//  GGSwitchTableViewCell.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 27/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GGSwitchTableViewCell;

@protocol GGSwitchTableViewCellDelegate <NSObject>

@optional
- (void)switchTableViewCellDidChangeValue:(GGSwitchTableViewCell *)cell;

@end

@interface GGSwitchTableViewCell : UITableViewCell

@property (nonatomic, readonly, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, readonly, strong) IBOutlet UISwitch *switchView;
@property (nonatomic, weak) id<GGSwitchTableViewCellDelegate> delegate;

- (IBAction)switchChanged:(id)sender;

@end
