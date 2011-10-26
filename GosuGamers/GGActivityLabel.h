//
//  GGActivityLabel.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 26/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGActivityLabel : UIView {
    UIActivityIndicatorView *_activityIndicatorView;
}

- (id)initWithStyle:(UIActivityIndicatorViewStyle)style;

@property (nonatomic, strong, readonly) UILabel *label;

@end
