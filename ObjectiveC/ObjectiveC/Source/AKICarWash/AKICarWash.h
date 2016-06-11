//
//  AKICarWash.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIBuilding.h"
#import "AKIWorker.h"

@interface AKICarWash : NSObject
@property (nonatomic, readonly, assign) NSArray *boxs;
@property (nonatomic, readonly, assign) NSArray *workers;
@property (nonatomic, readonly, assign) NSArray *cars;
@property (nonatomic, assign)           NSUInteger workerCount;
@property (nonatomic, assign)           NSUInteger carCount;

+ (instancetype)carWash;
- (void)addCar:(id)car;
- (void)removeCar:(id)car;
- (void)addWorker:(AKIWorker *)worker;
- (void)removeWorker:(AKIWorker *)worker;
- (AKIWorker *)getFreeWorker;
- (AKIBuilding *)getFreeBox;

@end
