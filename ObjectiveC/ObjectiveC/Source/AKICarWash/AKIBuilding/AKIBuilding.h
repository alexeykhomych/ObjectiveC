//
//  AKIBuilding.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIOffice.h"

@interface AKIBuilding : NSObject
@property (nonatomic, assign, getter=isFull) BOOL       Full;
@property (nonatomic, readonly) NSArray *build;
@property (nonatomic, readonly) NSUInteger floorCount;
@property (nonatomic, readonly) NSUInteger officesCount;

+ (instancetype)building;

@end
