// PFPointer.h
// Copyright 2011 Parse, Inc. All rights reserved.

#import <Foundation/Foundation.h>

/*!
 @class PFPointer
 @abstract A class that defines a pointer to a PFObject.
 */
@interface PFPointer : NSObject <NSCopying> {
    NSString *objectId;
    NSString *className;
}

/*!
 @abstract The object id.
 */
@property (nonatomic, retain) NSString *objectId;

/*!
 @abstract The object's class name.
 */
@property (nonatomic, retain) NSString *className;

- (id)proxyForJson;

/*!
 @abstract Initializes the object with a class name and object id.
 @param newClassName The class name.
 @param newObjectId The object id.
 */
- (id)initWithClassName:(NSString *)newClassName objectId:(NSString *)newObjectId;

/*!
 @abstract Helper function to create a pointer.
 @param newClassName The class name.
 @param newObjectId The object id.
 */
+ (PFPointer *)pointerWithClassName:(NSString *)newClassName objectId:(NSString *)newObjectId;

- (id)copyWithZone:(NSZone *)zone;

@end
