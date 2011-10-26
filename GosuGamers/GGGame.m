//
//  GGGame.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
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
                                color:[UIColor colorWithRed:0/255.0 green:79/255.0 blue:176/255.0 alpha:1.0]],
            [[self alloc] initWithUid:@"starcraft2"
                          description:@"Starcraft 2"
                             sections:[NSArray arrayWithObjects:@"news", @"matches", @"replays", nil]
                                color:[UIColor colorWithRed:25/255.0 green:93/255.0 blue:156/255.0 alpha:1.0]],
            [[self alloc] initWithUid:@"warcraft"
                          description:@"Warcraft 3"
                             sections:[NSArray arrayWithObjects:@"news", @"matches", @"replays", nil]
                                color:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:0/255.0 alpha:1.0]],
            [[self alloc] initWithUid:@"dota"
                          description:@"DotA"
                             sections:[NSArray arrayWithObjects:@"news", @"matches", @"replays", nil]
                                color:[UIColor colorWithRed:131/255.0 green:6/255.0 blue:0/255.0 alpha:1.0]],
            [[self alloc] initWithUid:@"dota2"
                          description:@"DotA 2"
                             sections:[NSArray arrayWithObject:@"news"]
                                color:[UIColor colorWithRed:0/255.0 green:79/255.0 blue:176/255.0 alpha:1.0]],
            [[self alloc] initWithUid:@"hon"
                          description:@"HoN"
                             sections:[NSArray arrayWithObjects:@"news", @"matches", nil]
                                color:[UIColor colorWithRed:70/255.0 green:103/255.0 blue:125/255.0 alpha:1.0]],
            [[self alloc] initWithUid:@"wow"
                          description:@"WoW"
                             sections:[NSArray arrayWithObject:@"news"]
                                color:[UIColor colorWithRed:214/255.0 green:91/255.0 blue:0/255.0 alpha:1.0]],
            [[self alloc] initWithUid:@"diablo"
                          description:@"Diablo 3"
                             sections:[NSArray arrayWithObject:@"news"]
                                color:[UIColor colorWithRed:205/255.0 green:86/255.0 blue:0/255.0 alpha:1.0]],
            [[self alloc] initWithUid:@"poker"
                          description:@"Poker"
                             sections:[NSArray arrayWithObject:@"news"]
                                color:[UIColor colorWithRed:136/255.0 green:7/255.0 blue:0/255.0 alpha:1.0]],
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
