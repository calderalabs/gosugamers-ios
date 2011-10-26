//
//  GGRemoteListController.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGGame.h"

@interface GGRemoteListController : UITableViewController <RKObjectLoaderDelegate> {
    UIActivityIndicatorView *_loadingView;
}

+ (id)objectClass;

@property (nonatomic, strong) GGGame *game;
@property (nonatomic, strong, readonly) NSArray *objects;

@end
