//
//  GGNews.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGNews.h"

@implementation GGNews

@synthesize game = _game;
@synthesize title = _title;
@synthesize link = _link;
@synthesize commentCount = _commentCount;
@synthesize createdAt = _createdAt;

+ (void)mapAttributes:(RKObjectMapping *)mapping {
    [super mapAttributes:mapping];
    
    [mapping mapKeyPath:@"created_at" toAttribute:@"createdAt"];
    [mapping mapKeyPath:@"title" toAttribute:@"title"];
    [mapping mapKeyPath:@"comment_count" toAttribute:@"commentCount"];
}

+ (NSString *)path {
    return @"news";
}

@end
