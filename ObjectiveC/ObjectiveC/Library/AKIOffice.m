//
//  AKIOffice.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIOffice.h"
#import "NSObject+AKICategory.h"

@interface AKIOffice()
@property (nonatomic, retain) NSMutableArray *mutableWorkers;
@property (nonatomic, retain)                   AKIBuilding *building;

@end

@implementation AKIOffice

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableWorkers= nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableWorkers = [NSMutableArray object];
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)workers {
    return [[self.mutableWorkers copy] autorelease];
}

- (NSUInteger)workerCount {
    return [self.mutableWorkers count];
}

#pragma mark -
#pragma mark Public Methods

- (void)addWorker:(AKIWorker *)worker {
    [self.mutableWorkers addObject:worker];
}

- (void)removeWorker:(AKIWorker *)worker {
    [self.mutableWorkers removeObject:worker];
}

@end
