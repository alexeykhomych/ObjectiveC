//
//  AKIBox.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIBox.h"
#import "NSObject+AKIExtensions.h"

static NSUInteger const kAKIMaxCarCount = 1;

@interface AKIBox()
@property (nonatomic, retain) NSMutableArray *mutableCars;

@end

@implementation AKIBox

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableCars = [NSMutableArray object];
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)cars {
    return [[self.mutableCars copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addCar:(AKICar *)car {
    if (!self.full) {
        [self.mutableCars addObject:car];
    }
}

- (void)removeCar:(AKICar *)car {
    [self.mutableCars removeObject:car];
}

- (BOOL)isFull {
    return kAKIMaxCarCount <= [self.mutableCars count];
}

@end
