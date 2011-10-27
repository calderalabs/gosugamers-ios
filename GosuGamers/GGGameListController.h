//
//  GGGameListController.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGRemoteListController.h"
#import "GGChannelsController.h"
#import "GGTableViewController.h"

@interface GGGameListController : GGTableViewController <GGRemoteListControllerDelegate, GGChannelsControllerDelegate>

@end
