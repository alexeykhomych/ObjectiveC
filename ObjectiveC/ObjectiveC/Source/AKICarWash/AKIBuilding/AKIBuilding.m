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

- (AKIWorker *)freeWorkerWithClass:(Class)cls {
    for (AKIOffice *office in self.mutableOffices) {
        for (AKIWorker *worker in [office workers]) {
            if ([worker isKindOfClass:cls] && worker.free) {
                return worker;
            }
        }
    }
    
    return nil;
}

- (AKIOffice *)freeOffice {
    for (AKIOffice *office in self.offices) {
        if (!office.isFull) {
            return office;
        }
    }
    
    return nil;
}

@end
