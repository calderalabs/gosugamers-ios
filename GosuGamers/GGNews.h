//
//  GGNews.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGRemoteObject.h"

@interface GGNews : GGRemoteObject

@property (nonatomic, copy, readonly) NSString *game;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSURL *link;
@property (nonatomic, copy, readonly) NSNumber *commentCount;

@end
