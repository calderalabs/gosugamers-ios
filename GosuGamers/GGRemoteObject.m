//
//  GGRemoteObject.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGRemoteObject.h"

@implementation GGRemoteObject

@synthesize uid = _uid;
@synthesize createdAt = _createdAt;

+ (void)mapAttributes:(RKObjectMapping *)mapping {
    [mapping mapKeyPath:@"id" toAttribute:@"uid"];
}

+ (RKObjectMapping *)mapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];
    [self mapAttributes:mapping];
    return mapping;
}

+ (NSString *)path {
    return nil;
}

@end
