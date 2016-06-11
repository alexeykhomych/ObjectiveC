//
//  AKIBuilding.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKIBuilding : NSObject
@property (nonatomic, assign) NSUInteger workerCount;
@property (nonatomic, assign) BOOL       isFree;

+ (instancetype)building;
- (void)room;

@end
