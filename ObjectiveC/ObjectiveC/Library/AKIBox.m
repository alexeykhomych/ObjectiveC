//
//  AKIBox.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIBox.h"
#import "NSObject+AKICategory.h"

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

- (id)init {
    self = [super init];
    self.mutableCars = [NSMutableArray object];
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)cars {
    return [[self copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addCar:(AKICar *)car {
    [self.mutableCars addObject:car];
}

- (void)removeCar:(AKICar *)car {
    [self.mutableCars removeObject:car];
}

@end
