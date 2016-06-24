//
//  AKICarWashWorkerTest.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 11.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWashWorkerTest.h"

#import "AKICarWash.h"
#import "AKICar.h"

#import "NSObject+AKIExtensions.h"

static NSUInteger const kAKICount = 100;

@implementation AKICarWashWorkerTest

- (void)performWorkerTest {
    AKICarWash *carWash = [AKICarWash object];
    
    for (NSUInteger i = 0; i < kAKICount; i++) {
        AKICar *car = [AKICar object];
        [carWash addCarToQueue:car];
    }
}

@end
