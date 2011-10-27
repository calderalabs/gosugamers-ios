//
//  GGRemoteListController.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGGame.h"
#import "GGTableViewController.h"

@class GGRemoteListController;

@protocol GGRemoteListControllerDelegate <NSObject>

@optional
- (void)remoteListControllerDidSelectListAction:(GGRemoteListController *)controller;

@end

@interface GGRemoteListController : GGTableViewController <RKObjectLoaderDelegate, UIActionSheetDelegate> {
    NSMutableArray *_objects;
}

+ (id)objectClass;

@property (nonatomic, strong) GGGame *game;
@property (nonatomic) NSUInteger page;
@property (nonatomic, strong, readonly) NSArray *objects;
@property (nonatomic, readonly, copy) NSString *emptyMessage;
@property (nonatomic, readonly, copy) NSString *errorMessage;
@property (nonatomic, weak) id<GGRemoteListControllerDelegate> delegate;

@end
