//
//  AKIWasher.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIWasher.h"
#import "AKIAccountant.h"

@interface AKIWasher()
@property (nonatomic, assign) AKIBuilding *_workPlace;

@end

@implementation AKIWasher

#pragma mark -
#pragma mark Accessors

- (AKIBuilding *)workPlace {
    return [[self._workPlace copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)doJob:(NSInteger)money {
    [self takeMoney:money];
    [self takeCar];
    [self washCar];
    [self giveCar];
    [self giveMoneyToWorker:self.chief];
}

- (void)takeCar {
    NSLog(@"%@ take a car", self.className);
}

- (void)washCar {
    NSLog(@"%@ wash a car", self.className);
}

- (void)takeMoney:(NSInteger)money {
    self.money = money;
}

- (void)giveMoneyToWorker:(AKIWorker *)worker {
    NSLog(@"Just a little time. I will give money to %@", [self.chief className]);
    [worker takeMoney:self.money];
}

- (void)giveCar {
    NSLog(@"%@ give a car", self.className);
}

- (void)setWorkPlace:(AKIBuilding *)workPlace {
    self._workPlace = workPlace;
}

- (AKIBuilding *)getWorkPlace {
    return self._workPlace;
}

@end
