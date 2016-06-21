//
//  AKIWorker.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "NSObject+AKIExtensions.h"
#import "AKIWorker.h"

@interface AKIWorker()
@property (nonatomic, assign) NSUInteger money;

@end

@implementation AKIWorker

#pragma mark -
#pragma mark Init/dealloc

- (instancetype)init {
    self = [super init];
    
    self.salary = arc4random_uniform(100);
    self.experience = arc4random_uniform(10);
    self.free = YES;
    
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)processObject:(id)object {
    self.free = NO;
    [self takeMoneyFromObject:object];
    self.free = YES;
}

- (void)receiveMoney:(NSUInteger)money {
    self.money += money;
}

- (void)giveMoney:(NSUInteger)money {
    self.money -= money;
}

- (void)takeMoneyFromObject:(id<AKIMoney>)object {
    NSUInteger money = object.money;
    [object giveMoney:money];
    [self receiveMoney:money];
}

@end
