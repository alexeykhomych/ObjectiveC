//
//  AKIOffice.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIWorker.h"
#import "AKIBuilding.h"

@interface AKIOffice : NSObject
@property (nonatomic, copy, readonly)           NSArray     *workers;
@property (nonatomic, readonly)                 NSUInteger  workerCount;
@property (nonatomic, retain)                   AKIBuilding *building;
@property (nonatomic, readonly, getter=isFull)  BOOL        full;

+ (instancetype)office;
+ (instancetype)officeWithCapacity:(NSUInteger)capacity;

- (id)initWithCapacity:(NSUInteger)capacity;

- (BOOL)addWorker:(AKIWorker *)worker;
- (void)removeWorker:(AKIWorker *)worker;

@end
