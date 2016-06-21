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

#import "NSObject+AKICategory.h"

@implementation AKICarWashWorkerTest

- (void)performWorkerTest {
    AKICarWash *carWash = [[AKICarWash new] autorelease];
    
    for (NSUInteger i = 0; i < 100; i++) {
        AKICar *car = [[AKICar new] autorelease];
        [carWash addCarToQueue:car];
    }
}

@end
