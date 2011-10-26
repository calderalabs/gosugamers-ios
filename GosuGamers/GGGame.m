//
//  GGGame.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GGGame.h"

@implementation GGGame

@synthesize description = _description;
@synthesize uid = _uid;
@synthesize sections = _sections;
@synthesize color = _color;

+ (NSArray *)all {
    return [NSArray arrayWithObjects:
            [[self alloc] initWithUid:@"starcraft"
                          description:@"Starcraft"
                             sections:[NSArray arrayWithObjects:@"news", @"matches", @"replays", nil]
                                color:[UIColor blueColor]],
            [[self alloc] initWithUid:@"starcraft2"
                          description:@"Starcraft 2"
                             sections:[NSArray arrayWithObjects:@"news", @"matches", @"replays", nil]
                                color:[UIColor blueColor]],
            [[self alloc] initWithUid:@"warcraft"
                          description:@"Warcraft 3"
                             sections:[NSArray arrayWithObjects:@"news", @"matches", @"replays", nil]
                                color:[UIColor blueColor]],
            [[self alloc] initWithUid:@"dota"
                          description:@"DotA"
                             sections:[NSArray arrayWithObjects:@"news", @"matches", @"replays", nil]
                                color:[UIColor blueColor]],
            [[self alloc] initWithUid:@"dota2"
                          description:@"DotA 2"
                             sections:[NSArray arrayWithObject:@"news"]
                                color:[UIColor blueColor]],
            [[self alloc] initWithUid:@"hon"
                          description:@"HoN"
                             sections:[NSArray arrayWithObjects:@"news", @"matches", nil]
                                color:[UIColor blueColor]],
            [[self alloc] initWithUid:@"wow"
                          description:@"WoW"
                             sections:[NSArray arrayWithObject:@"news"]
                                color:[UIColor blueColor]],
            [[self alloc] initWithUid:@"diablo"
                          description:@"Diablo 3"
                             sections:[NSArray arrayWithObject:@"news"]
                                color:[UIColor blueColor]],
            [[self alloc] initWithUid:@"poker"
                          description:@"Poker"
                             sections:[NSArray arrayWithObject:@"news"]
                                color:[UIColor blueColor]],
            nil];
}

- (id)initWithUid:(NSString *)uid
      description:(NSString *)description
         sections:(NSArray *)sections
            color:(UIColor *)color {
    if((self = [super init])) {
        _uid = [uid copy];
        _description = [description copy];
        _sections = sections;
        _color = color;
    }
    
    return self;
}

@end
