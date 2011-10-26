//
//  GGActivityLabel.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 26/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGActivityLabel.h"

static CGFloat kVPadding = 10.0;

@implementation GGActivityLabel

@synthesize label = _label;

- (id)initWithStyle:(UIActivityIndicatorViewStyle)style
{
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor clearColor];
        
        [_activityIndicatorView startAnimating];
        
        [self addSubview:_activityIndicatorView];
        [self addSubview:_label];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    return [self initWithStyle:UIActivityIndicatorViewStyleGray];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize activitySize = [_activityIndicatorView sizeThatFits:size];
    CGSize labelSize = [_label sizeThatFits:size];
    
    return CGSizeMake(fmax(activitySize.width, labelSize.width),
                      activitySize.height + kVPadding + labelSize.height);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_activityIndicatorView sizeToFit];
    
    _activityIndicatorView.frame = CGRectMake(floor((self.frame.size.width - _activityIndicatorView.frame.size.width) / 2),
                                              0,
                                              _activityIndicatorView.frame.size.width,
                                              _activityIndicatorView.frame.size.height);
    
    [_label sizeToFit];
    
    _label.frame = CGRectMake(floor((self.frame.size.width - _label.frame.size.width) / 2),
                              _activityIndicatorView.frame.size.height + kVPadding,
                              _label.frame.size.width,
                              _label.frame.size.height);
}

@end
