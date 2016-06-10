//
//  AKIWasher.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIWasher.h"
#import "AKIAccountant.h"

@implementation AKIWasher

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
    NSLog(@"%@ take a car", self);
}

- (void)washCar {
    NSLog(@"%@ wash a car", self);
}

- (void)takeMoney:(NSInteger)money {
    self.money = money;
    [self doJob];
}

- (void)giveMoneyToWorker:(AKIWorker *)worker {
    NSLog(@"Just a little time. I will give money to %@", [self.chief className]);
    [worker takeMoney:self.money];
}

- (void)giveCar {
    NSLog(@"%@ give a car", self);
}

@end
