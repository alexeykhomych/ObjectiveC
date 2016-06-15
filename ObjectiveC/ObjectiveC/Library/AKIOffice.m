//
//  AKIOffice.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIOffice.h"
#import "NSObject+AKICategory.h"
#import "AKIWorker.h"

static NSUInteger const kAKIOfficesMaxCount = 10;
static NSUInteger const kAKIOfficecMaxCountOnFloor = 10;

@interface AKIOffice()
@property (nonatomic, retain) NSMutableArray    *mutableWorkers;

@end

@implementation AKIOffice

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
    self.mutableWorkers = nil;
    
    [super dealloc];
}

+ (instancetype)office {
    AKIOffice *office = [super object];
    office.mutableWorkers = [NSMutableArray object];
    
    return [super object];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)workers {
    return [[self copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)addWorker:(AKIWorker *)worker {
    [self.mutableWorkers addObject:worker];
}

- (void)removeWorker:(AKIWorker *)worker {
    [self.mutableWorkers removeObject:worker];
}
- (NSArray *)allWorkers {
    return self.mutableWorkers;
}

@end
