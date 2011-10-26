//
//  GGRemoteListController.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGGame.h"

@class GGRemoteListController;

@protocol GGRemoteListControllerDelegate <NSObject>

@optional
- (void)remoteListControllerDidSelectListAction:(GGRemoteListController *)controller;

@end

@interface GGRemoteListController : UIViewController

<RKObjectLoaderDelegate,
UITableViewDelegate,
UITableViewDataSource>

{
    UIView *_overlayView;
}

+ (id)objectClass;

@property (nonatomic, strong) GGGame *game;
@property (nonatomic, strong, readonly) NSArray *objects;
@property (nonatomic, strong, readonly) IBOutlet UITableView *tableView;
@property (nonatomic, readonly, copy) NSString *emptyMessage;
@property (nonatomic, readonly, copy) NSString *errorMessage;
@property (nonatomic, weak) id<GGRemoteListControllerDelegate> delegate;

@end
