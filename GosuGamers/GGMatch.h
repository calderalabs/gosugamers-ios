//
//  GGMatch.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGRemoteObject.h"

@interface GGMatch : GGRemoteObject

@property (nonatomic, copy, readonly) NSString *eta;
@property (nonatomic, copy, readonly) NSString *game;
@property (nonatomic, copy, readonly) NSString *playerOne;
@property (nonatomic, copy, readonly) NSString *playerTwo;
@property (nonatomic, copy, readonly) NSURL *link;
@property (nonatomic, copy, readonly) NSNumber *betCount;
@property (nonatomic, copy, readonly) NSNumber *commentCount;

@end
