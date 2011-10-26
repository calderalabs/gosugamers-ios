//
//  GGRemoteObject.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//



@interface GGRemoteObject : NSObject

@property (nonatomic, copy, readonly) NSNumber *uid;
@property (nonatomic, copy, readonly) NSDate *createdAt;

+ (void)mapAttributes:(RKObjectMapping *)mapping;
+ (RKObjectMapping *)mapping;
+ (NSString *)path;

@end
