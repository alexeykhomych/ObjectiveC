//
//  AKIWorker.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "NSObject+AKICategory.h"
#import "AKIWorker.h"
#import "AKIMoney.h"

@implementation AKIWorker

@synthesize money = _money;

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
    self.free = YES;
    [super dealloc];
}

- (id)init {
    self = [super init];
    
    self.salary = arc4random_uniform(100);
    self.experience = arc4random_uniform(10);
    self.free = YES;
    
    return self;
}

+ (instancetype)worker {
    return [self init];
}

#pragma mark -
#pragma mark Public methods

- (void)processObject:(id)object {
    [self takeMoney:object];
}

- (void)takeMoney:(id)object {
    self.money += [object giveMoney];
}

- (NSUInteger)giveMoney {
    return self.money;
}

@end
