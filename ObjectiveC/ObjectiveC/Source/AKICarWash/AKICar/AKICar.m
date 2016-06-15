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

- (void)dealloc {
    [super dealloc];
}

+ (instancetype)car {
    AKICar *car = [[self new] autorelease];
    
    car.money = arc4random_uniform(100);
    car.clean = NO;
    
    return car;
}

@end
