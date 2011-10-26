//
//  GGMatchesListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGMatchesListController.h"
#import "GGMatch.h"

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
    cell.textLabel.text = [match.uid description];
}

@end
