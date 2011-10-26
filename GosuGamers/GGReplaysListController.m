//
//  GGReplaysListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GGReplaysListController.h"
#import "GGReplay.h"

@implementation GGReplaysListController

+ (id)objectClass {
    return [GGReplay class];
}

- (void)configureCell:(UITableViewCell *)cell withObject:(id)object {
    GGReplay *replay = object;
    cell.textLabel.text = [replay.uid description];
}

@end
