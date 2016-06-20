//
//  AKICar.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 15.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICar.h"
#import "NSObject+AKICategory.h"

@interface AKICar()
@property (nonatomic, assign)NSUInteger money;

@end

@implementation AKICar

#pragma mark -
#pragma mark Initializations and Dealoocations

- (void)dealloc {
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.money = 10;
    self.clean = NO;
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

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
