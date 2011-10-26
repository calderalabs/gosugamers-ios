//
//  GGGame.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGGame : NSObject

@property (nonatomic, copy, readonly) NSString *uid;
@property (nonatomic, copy, readonly) NSString *description;
@property (nonatomic, strong, readonly) NSArray *sections;
@property (nonatomic, strong, readonly) UIColor *color;

+ (NSArray *)all;

- (id)initWithUid:(NSString *)uid
      description:(NSString *)description
         sections:(NSArray *)sections
            color:(UIColor *)color;

@end
