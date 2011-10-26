//
//  GGReplay.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGRemoteObject.h"

@interface GGReplay : GGRemoteObject

@property (nonatomic, copy, readonly) NSDate *date;
@property (nonatomic, copy, readonly) NSString *game;
@property (nonatomic, copy, readonly) NSString *playerOne;
@property (nonatomic, copy, readonly) NSString *playerTwo;
@property (nonatomic, copy, readonly) NSString *map;
@property (nonatomic, copy, readonly) NSString *event;
@property (nonatomic, copy, readonly) NSNumber *rating;
@property (nonatomic, copy, readonly) NSURL *link;
@property (nonatomic, copy, readonly) NSNumber *downloadCount;
@property (nonatomic, copy, readonly) NSNumber *commentCount;

@end
