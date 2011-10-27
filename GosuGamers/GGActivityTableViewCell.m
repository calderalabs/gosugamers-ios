//
//  GGActivityTableViewCell.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 27/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGActivityTableViewCell.h"

@implementation GGActivityTableViewCell

@synthesize titleLabel = _titleLabel;
@synthesize activityView = _activityView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15.0];
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityView.alpha = 0.0;
        
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_activityView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel sizeToFit];
    [_activityView sizeToFit];
    
    _titleLabel.frame = CGRectMake(floor((self.contentView.frame.size.width - _titleLabel.frame.size.width) / 2),
                                   floor((self.contentView.frame.size.height - _titleLabel.frame.size.height) / 2),
                                   _titleLabel.frame.size.width,
                                   _titleLabel.frame.size.height);
    
    _activityView.frame = CGRectMake(floor((self.contentView.frame.size.width - _activityView.frame.size.width) / 2),
                                     floor((self.contentView.frame.size.height - _activityView.frame.size.height) / 2),
                                     _activityView.frame.size.width,
                                     _activityView.frame.size.height);
}

- (void)startAnimating {
    [_activityView startAnimating];
    
    [UIView animateWithDuration:0.2 animations:^{
        _titleLabel.alpha = 0.0;
        _activityView.alpha = 1.0;
    }];
}

- (void)stopAnimating {
    [UIView animateWithDuration:0.2
                     animations:^{
                         _titleLabel.alpha = 1.0;
                         _activityView.alpha = 0.0;
                     }
                     completion:^(BOOL finished) { [_activityView stopAnimating]; }];
}

@end
