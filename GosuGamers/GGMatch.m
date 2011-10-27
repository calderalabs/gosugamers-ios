//
//  GGMatch.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGMatch.h"

@implementation GGMatch

@synthesize eta = _eta;
@synthesize game = _game;
@synthesize playerOne = _playerOne;
@synthesize playerTwo = _playerTwo;
@synthesize link = _link;
@synthesize commentCount = _commentCount;
@synthesize betCount = _betCount;

+ (NSString *)path {
    return @"matches";
}

+ (void)mapAttributes:(RKObjectMapping *)mapping {
    [super mapAttributes:mapping];
    
    [mapping mapKeyPath:@"eta" toAttribute:@"eta"];
    [mapping mapKeyPath:@"player_one" toAttribute:@"playerOne"];
    [mapping mapKeyPath:@"player_two" toAttribute:@"playerTwo"];
    [mapping mapKeyPath:@"comment_count" toAttribute:@"commentCount"];
    [mapping mapKeyPath:@"bet_count" toAttribute:@"betCount"];
}

@end
