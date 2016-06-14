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
@property (nonatomic, retain) NSMutableArray    *_workersInOffice;
@property (nonatomic, retain) NSMutableArray    *_offices;
@property (nonatomic, retain) NSMutableArray    *_floor;
@property (nonatomic, assign) NSUInteger        officesCount;
@property (nonatomic, assign) NSUInteger        officeNumber;
@property (nonatomic, assign) NSString    *name;

@end

@implementation AKIOffice

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
    self._offices = nil;
    self._workersInOffice = nil;
    self._floor = nil;
    
    [super dealloc];
}

+ (instancetype)officeInitWithName:(NSString *)name {
    AKIOffice *office = [super object];
    office._floor = [NSMutableArray object];
    office._workersInOffice = [NSMutableArray object];
    office._offices = [NSMutableArray object];
    office.officeNumber = arc4random_uniform(100);
    office.name = name;
    
    return [super object];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)workersInOffice {
    return [[self copy] autorelease];
}

- (NSArray *)offices {
    return [[self copy] autorelease];
}

- (NSArray *)floor {
    return [[self copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)addOffice:(AKIOffice *)office {
    if (kAKIOfficesMaxCount > self.officesCount) {
        [self._offices addObject:office];
        self.officesCount += 1;
    }
}

- (void)removeOffice:(AKIOffice *)office {
    [self._offices removeObject:office];
    self.officesCount -= 1;
}

- (id)getOfficeByNumber:(NSUInteger)number {
    return nil;
}

- (id)getWorkersByOfficeNumber:(NSUInteger)number {
    NSMutableArray *workers = [NSMutableArray object];
    
    return workers;
}

@end
