//
//  GGMatchesListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGMatchesListController.h"
#import "GGMatch.h"
#import "GGMatchTableViewCell.h"
#import "NSDate+Helper.h"

@implementation GGMatchesListController

+ (id)objectClass {
    return [GGMatch class];
}

- (NSString *)emptyMessage {
    return @"No matches found today!";
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if((self = [super initWithCoder:aDecoder])) {
        self.tabBarItem.image = [UIImage imageNamed:@"Matches"];
    }
    
    return self;
}

- (void)configureCell:(UITableViewCell *)cell withObject:(id)object {
    GGMatch *match = object;
    GGMatchTableViewCell *matchCell = (GGMatchTableViewCell *)cell;
    
    matchCell.playerOneLabel.text = match.playerOne;
    matchCell.playerTwoLabel.text = match.playerTwo;
    matchCell.dateLabel.text = match.eta;
    matchCell.bottomLeftDetailLabel.text = [NSString stringWithFormat:@"%@ comments", match.commentCount];
    matchCell.bottomRightDetailLabel.text = [NSString stringWithFormat:@"%@ bets", match.betCount];
}

@end
