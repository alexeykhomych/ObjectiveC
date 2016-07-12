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

- (void)performWorkWithObject:(id)car {
    @synchronized (self) {
        [self washCar:car];
        [self takeMoneyFromObject:car];
    }
}

- (void)finishProcessingObject:(AKICar *)car {
    @synchronized (self) {
        car.clean = YES;
        NSLog(@"%@ машина чистая", car);
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)washCar:(AKICar *)car {
    @synchronized (self) {
        NSLog(@"%@ помыл машину", self.className);
    }
}

@end
