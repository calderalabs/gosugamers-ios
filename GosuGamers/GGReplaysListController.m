//
//  GGReplaysListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGReplaysListController.h"
#import "GGReplay.h"
#import "NSDate+Helper.h"
#import "GGReplayTableViewCell.h"

@implementation GGReplaysListController

+ (id)objectClass {
    return [GGReplay class];
}

- (NSString *)emptyMessage {
    return @"No replays found today!";
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if((self = [super initWithCoder:aDecoder])) {
        self.tabBarItem.image = [UIImage imageNamed:@"Replays"];
    }
    
    return self;
}

- (void)configureCell:(UITableViewCell *)cell withObject:(GGRemoteObject *)object {
    GGReplay *replay = (GGReplay *)object;
    GGReplayTableViewCell *replayCell = (GGReplayTableViewCell *)cell;
    replayCell.topLeftDetailLabel.text = [NSString stringWithFormat:@"Event: %@", replay.event];
    replayCell.topRightDetailLabel.text = [NSString stringWithFormat:@"Map: %@", replay.map];
    replayCell.playerOneLabel.text = replay.playerOne;
    replayCell.playerTwoLabel.text = replay.playerTwo;
    replayCell.dateLabel.text = [NSDate stringForDisplayFromDate:replay.date];
    replayCell.bottomRightDetailLabel.text = [NSString stringWithFormat:@"%@ downloads", replay.downloadCount];
    replayCell.bottomLeftDetailLabel.text = [NSString stringWithFormat:@"%@ comments", replay.commentCount];
    replayCell.ratingView.rating = [replay.rating floatValue] / 2;
    replayCell.ratingView.userInteractionEnabled = NO;
    [replayCell.ratingView setStarImage:[UIImage imageNamed:@"StarNonSelected"] forState:kSCRatingViewNonSelected];
	[replayCell.ratingView setStarImage:[UIImage imageNamed:@"StarSelected"] forState:kSCRatingViewSelected];
	[replayCell.ratingView setStarImage:[UIImage imageNamed:@"StarHalfSelected"] forState:kSCRatingViewHalfSelected];
}

@end
