//
//  GGActivityTableViewCell.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 27/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGActivityTableViewCell : UITableViewCell

@property (nonatomic, readonly, strong) UILabel *titleLabel;
@property (nonatomic, readonly, strong) UIActivityIndicatorView *activityView;

- (void)startAnimating;
- (void)stopAnimating;

@end
