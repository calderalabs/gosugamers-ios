//
//  GGNewsListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GGNewsListController.h"
#import "GGNews.h"

@implementation GGNewsListController

+ (id)objectClass {
    return [GGNews class];
}

- (void)configureCell:(UITableViewCell *)cell withObject:(id)object {
    GGNews *news = object;
    cell.textLabel.text = news.title;
}

@end
