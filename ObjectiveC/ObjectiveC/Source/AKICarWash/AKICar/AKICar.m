//
//  AKICar.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 15.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICar.h"
#import "NSObject+AKIExtensions.h"

static NSUInteger const kAKIMoney = 10;

@interface AKICar()
@property (nonatomic, assign) NSUInteger money;

@end

@implementation AKICar

#pragma mark -
#pragma mark Initializations and Dealoocations

- (instancetype)init {
    self = [super init];
    
    self.money = kAKIMoney;
    self.clean = NO;
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)giveMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money -= money;
    }
}

- (void)receiveMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money += money;
    }
}

@end
