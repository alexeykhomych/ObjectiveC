//
//  AKIBuilding.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIBuilding.h"
#import "NSObject+AKIExtensions.h"

@interface AKIBuilding()
@property (nonatomic, retain) NSMutableArray *mutableOffices;

- (NSArray *)allWorkersFromOffice:(id)office;

@end

@implementation AKIBuilding

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableOffices = nil;
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableOffices = [NSMutableArray object];

    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)offices {
    return [[self.mutableOffices copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addOffice:(AKIOffice *)office {
    [self.mutableOffices addObject:office];
}

- (void)removeOffice:(AKIOffice *)office {
    [self.mutableOffices removeObject:office];
}

- (NSMutableArray *)freeWorkerWithClass:(Class)cls {
    NSMutableArray *freeWorkers = [NSMutableArray object];
    NSMutableArray *allWorkers = nil;
    
    for (AKIOffice *office in self.mutableOffices) {
        
        allWorkers = [[[self allWorkersFromOffice:office] copy] autorelease];
        
        for (AKIWorker *worker in allWorkers) {
            if ([worker isKindOfClass:cls] && worker.free) {
                [freeWorkers addObject:worker];
            }
        }
    }
    
    return freeWorkers;
}

- (AKIOffice *)freeOffice {
    for (AKIOffice *office in self.offices) {
        if (!office.isFull) {
            return office;
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark Private Methods

- (NSArray *)allWorkersFromOffice:(AKIOffice *)office {
    return [office allWorkers];
}

@end
