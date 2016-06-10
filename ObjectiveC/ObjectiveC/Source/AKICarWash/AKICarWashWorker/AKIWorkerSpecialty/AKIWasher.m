//
//  AKIWasher.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIWasher.h"

static NSInteger const kMoney = 10;

@implementation AKIWasher

#pragma mark -
#pragma mark Public Implementations

- (void)doJob {
    [self takeCar];
    [self takeMoney:kMoney];
}

- (void)takeCar {
    NSLog(@"%@ take a car", self);
}

- (void)washCar {
    NSLog(@"%@ wash a car", self);
}

- (void)takeMoney:(NSInteger)money {
    self.money = money;
}

- (void)giveMoneyToWorker:(AKIWorker *)worker {
    [worker takeMoney:self.money];
}

- (void)giveCar {
    NSLog(@"%@ give a car", self);
}

@end
