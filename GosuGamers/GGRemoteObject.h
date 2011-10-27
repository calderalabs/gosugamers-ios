//
//  GGRemoteObject.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//



@interface GGRemoteObject : NSObject

@property (nonatomic, copy, readonly) NSNumber *uid;
@property (nonatomic, copy, readonly) NSURL *link;
@property (nonatomic, copy, readonly) NSString *game;

+ (void)mapAttributes:(RKObjectMapping *)mapping;
+ (RKObjectMapping *)mapping;
+ (NSString *)path;

@end
