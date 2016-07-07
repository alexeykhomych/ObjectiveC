//
//  AKIBuilding.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIBuilding.h"
#import "NSObject+AKIExtensions.h"
#import "AKIOffice.h"

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

- (NSMutableArray *)workerWithClass:(Class)cls {
    NSMutableArray *workers = [NSMutableArray object];
    
    for (AKIOffice *office in self.offices) {
        [workers addObjectsFromArray:[office workerWithClass:cls]];
    }
    
    return [[workers copy] autorelease];
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
