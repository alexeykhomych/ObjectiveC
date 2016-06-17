//
//  AKIWasher.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIWasher.h"
#import "AKICar.h"

@implementation AKIWasher

#pragma mark -
#pragma mark Public Methods

- (void)processObject:(AKICar *)car {
    [self washCar:car];
    [self takeMoney:car];
}

#pragma mark -
#pragma mark Private Methods

- (void)washCar:(AKICar *)car {
    NSLog(@"%@ wash a car", self.className);
    [car setClean:YES];
}

@end
