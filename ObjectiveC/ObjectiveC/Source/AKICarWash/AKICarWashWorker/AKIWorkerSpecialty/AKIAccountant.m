//
//  AKIAccountant.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAccountant.h"
#import "AKIWasher.h"

@implementation AKIAccountant

#pragma mark -
#pragma mark Public Methods

- (void)performWorkWithObject:(id)object {
    [self takeMoneyFromObject:object];
    [self calculateSalary:object];
    [self finishProcessingObject:object];
}

- (void)finishProcessingObject:(AKIWasher *)washer {
    washer.state = AKIWorkerPending;
}

#pragma mark -
#pragma mark Private Methods

- (void)calculateSalary:(AKIWorker *)worker {
    NSLog(@"Accountant had calculated salary");
}

@end
