//
//  AKIWasher.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIWasher.h"
#import "AKICar.h"

@interface AKIWasher()

- (void)washCar:(AKICar *)car;

@end

@implementation AKIWasher

#pragma mark -
#pragma mark Public Methods

- (void)processObject:(AKICar *)car {
    self.free = NO;
    [self washCar:car];
    [self takeMoneyFromObject:car];
    self.free = YES;
}

#pragma mark -
#pragma mark Private Methods

- (void)washCar:(AKICar *)car {
    NSLog(@"%@ wash a car", self.className);
    car.clean = YES;
}

@end
