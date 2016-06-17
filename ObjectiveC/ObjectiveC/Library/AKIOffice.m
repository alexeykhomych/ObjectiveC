//
//  AKIOffice.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIOffice.h"
#import "NSObject+AKICategory.h"

static NSUInteger const kAKIMaxOfficeCount = 5;

@interface AKIOffice()
@property (nonatomic, retain) NSMutableArray *mutableWorkers;
@property (nonatomic, assign) NSUInteger capacity;

@end

@implementation AKIOffice

#pragma mark -
#pragma mark Class Methods

+ (id)office {
    return [self officeWithCapacity:kAKIMaxOfficeCount];
}

+ (id)officeWithCapacity:(NSUInteger)capacity {
    return [[self alloc] initWithCapacity:capacity];
}

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableWorkers= nil;
    
    [super dealloc];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super init];
    self.mutableWorkers = [NSMutableArray object];
    self.capacity = capacity ? capacity : kAKIMaxOfficeCount;
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)workers {
    return [[self.mutableWorkers copy] autorelease];
}

- (BOOL)isFull {
    return self.capacity <= self.workerCount;
}

- (NSUInteger)workerCount {
    return [self.mutableWorkers count];
}

#pragma mark -
#pragma mark Public Methods

- (BOOL)addWorker:(AKIWorker *)worker {
    if (self.full) {
        return NO;
    }
    
    [self.mutableWorkers addObject:worker];
    
    return YES;
}

- (void)removeWorker:(AKIWorker *)worker {
    [self.mutableWorkers removeObject:worker];
}

@end
