//
//  GGReplayTableViewCell.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 26/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGMatchTableViewCell.h"
#import "SCRRatingView.h"

@interface GGReplayTableViewCell : GGMatchTableViewCell

@property (nonatomic, strong, readonly) IBOutlet UILabel *topLeftDetailLabel;
@property (nonatomic, strong, readonly) IBOutlet UILabel *topRightDetailLabel;
@property (nonatomic, strong, readonly) IBOutlet SCRRatingView *ratingView;

@end
