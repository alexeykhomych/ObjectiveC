//
//  AKIQueue.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 20.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIQueue.h"
#import "AKIBuilding.h"
#import "AKIWorker.h"

@interface AKIQueue()
@property (nonatomic, retain) NSMutableArray *mutableQueue;

@end

@implementation AKIQueue

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableQueue = [[NSMutableArray array] autorelease];
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)queue {
    return [[self copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addCar:(AKICar *)car {
    [self.mutableQueue addObject:car];
}

- (void)removeCar {
    [self.mutableQueue removeObject:[self.mutableQueue firstObject]];
}

- (AKICar *)nextCar {
    return [self.mutableQueue firstObject];
}

#pragma mark -
#pragma mark Private Methods

@end
