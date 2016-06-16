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
    
    self.free = NO;
    
    [self washCar];
    [self giveMoneyToWorker:self.chief];
    
    self.free = YES;
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
    [worker setMoney:0];
}

@end
