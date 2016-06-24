//
//  AKIOffice.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIOffice.h"
#import "NSObject+AKIExtensions.h"

@interface AKIOffice()
@property (nonatomic, retain) NSMutableArray    *mutableWorkers;
@property (nonatomic, retain) AKIBuilding       *building;

@end

@implementation AKIOffice

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableWorkers = nil;
    
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

#pragma mark -
#pragma mark Public Methods

- (void)addWorker:(AKIWorker *)worker {
    if (!worker) {
        return;
    }
    
    [self.mutableWorkers addObject:worker];
}

- (void)removeWorker:(AKIWorker *)worker {
    [self.mutableWorkers removeObject:worker];
}

- (NSArray *)freeWorkerWithClass:(Class)cls {
    NSMutableArray *workers = [NSMutableArray object];
    
    for (AKIWorker *worker in self.workers) {
        if ([worker isKindOfClass:cls]) {
            [workers addObject:worker];
        }
    }
    
    return [[workers copy] autorelease];
}

@end
