//
//  AKIBuilding.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIBuilding.h"
#import "NSObject+AKICategory.h"

@interface AKIBuilding()
@property (nonatomic, retain) NSMutableArray *mutableOffices;

- (AKIOffice *)freeOffice;

@end

@implementation AKIBuilding

#pragma mark -
#pragma mark Class Methods

+ (instancetype)building {
    return [self init];
}

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableOffices = nil;
    [super dealloc];
}

- (id)init {
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

- (BOOL)addWorker:(AKIWorker *)worker {
    AKIOffice *office = [self freeOffice];
    return [office addWorker:worker];
}

- (void)removeWorker:(AKIWorker *)worker {
    for (AKIOffice *office in self.offices) {
        [office removeWorker:worker];
    }
}

#pragma mark -
#pragma mark - Private Methods

- (AKIOffice *)freeOffice {
    for (AKIOffice *office in self.offices) {
        if (!office.isFull) {
            return office;
        }
    }
    
    return nil;
}

@end
