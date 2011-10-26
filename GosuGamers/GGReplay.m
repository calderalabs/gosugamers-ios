//
//  GGReplay.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGReplay.h"

@implementation GGReplay

@synthesize date = _date;
@synthesize game = _game;
@synthesize playerOne = _playerOne;
@synthesize playerTwo = _playerTwo;
@synthesize map = _map;
@synthesize event = _event;
@synthesize link = _link;
@synthesize rating = _rating;
@synthesize commentCount = _commentCount;
@synthesize downloadCount = _downloadCount;

+ (NSString *)path {
    return @"replays";
}

+ (void)mapAttributes:(RKObjectMapping *)mapping {
    [super mapAttributes:mapping];
    
    [mapping mapKeyPath:@"date" toAttribute:@"date"];
    [mapping mapKeyPath:@"game" toAttribute:@"game"];
    [mapping mapKeyPath:@"player_one" toAttribute:@"playerOne"];
    [mapping mapKeyPath:@"player_two" toAttribute:@"playerTwo"];
    [mapping mapKeyPath:@"map" toAttribute:@"map"];
    [mapping mapKeyPath:@"event" toAttribute:@"event"];
    [mapping mapKeyPath:@"link" toAttribute:@"link"];
    [mapping mapKeyPath:@"rating" toAttribute:@"rating"];
    [mapping mapKeyPath:@"comment_count" toAttribute:@"commentCount"];
    [mapping mapKeyPath:@"download_count" toAttribute:@"downloadCount"];
}

@end
