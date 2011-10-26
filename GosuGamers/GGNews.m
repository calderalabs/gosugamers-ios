//
//  GGNews.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGNews.h"

@implementation GGNews

@synthesize game;
@synthesize title;
@synthesize link;
@synthesize commentCount;

+ (void)mapAttributes:(RKObjectMapping *)mapping {
    [super mapAttributes:mapping];
    
    [mapping mapKeyPath:@"game" toAttribute:@"game"];
    [mapping mapKeyPath:@"title" toAttribute:@"title"];
    [mapping mapKeyPath:@"link" toAttribute:@"link"];
    [mapping mapKeyPath:@"comment_count" toAttribute:@"commentCount"];
}

+ (NSString *)path {
    return @"news";
}

@end
