//
//  GGSwitchTableViewCell.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 27/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGSwitchTableViewCell.h"

@implementation GGSwitchTableViewCell

@synthesize switchView = _switchView;
@synthesize titleLabel = _titleLabel;
@synthesize delegate = _delegate;

- (IBAction)switchChanged:(id)sender {
    if([_delegate respondsToSelector:@selector(switchTableViewCellDidChangeValue:)])
        [_delegate switchTableViewCellDidChangeValue:self];
}

@end
