//
//  GGReplaysListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGReplaysListController.h"
#import "GGReplay.h"

@implementation GGReplaysListController

+ (id)objectClass {
    return [GGReplay class];
}

- (NSString *)emptyMessage {
    return @"No replays found today!";
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if((self = [super initWithCoder:aDecoder])) {
        self.tabBarItem.image = [UIImage imageNamed:@"Replays"];
    }
    
    return self;
}

- (void)configureCell:(UITableViewCell *)cell withObject:(id)object {
    GGReplay *replay = object;
    cell.textLabel.text = [replay.uid description];
}

@end
