//
//  GGNewsListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGNewsListController.h"
#import "GGNews.h"
#import "GGNewsTableViewCell.h"
#import "NSDate+Helper.h"

@implementation GGNewsListController

+ (id)objectClass {
    return [GGNews class];
}

- (NSString *)emptyMessage {
    return @"No news found today!";
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if((self = [super initWithCoder:aDecoder])) {
        self.tabBarItem.image = [UIImage imageNamed:@"News"];
    }
    
    return self;
}

- (void)configureCell:(UITableViewCell *)cell withObject:(id)object {
    GGNewsTableViewCell *newsCell = (GGNewsTableViewCell *)cell;
    GGNews *news = object;
    newsCell.titleLabel.text = news.title;
    newsCell.topDetailLabel.text = [NSString stringWithFormat:@"%@ comments", news.commentCount];
    newsCell.bottomDetailLabel.text = [NSDate stringForDisplayFromDate:news.createdAt];
}

@end
