//
//  AKICar.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 15.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICar.h"
#import "NSObject+AKICategory.h"

@implementation AKICar

#pragma mark -
#pragma mark Class Methods

+ (instancetype)car {
    return [self init];
}


#pragma mark -
#pragma mark Initializations and Dealoocations

- (void)dealloc {
    [super dealloc];
}

- (id)car {
    AKICar *car = [super init];
    
    car.money = 10;
    car.clean = NO;
    
    return car;
}

#pragma mark -
#pragma mark Private Methods

- (void)takeMoney:(id)object {
    self.money += [object giveMoney];
}

- (NSUInteger)giveMoney {
    return self.money;
}

@end
