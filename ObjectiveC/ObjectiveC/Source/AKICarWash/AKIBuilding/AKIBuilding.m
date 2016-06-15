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
@property (nonatomic, retain) NSMutableArray    *_offices;

@end

@implementation AKIBuilding

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
    self._offices = nil;
    [super dealloc];
}

+ (instancetype)building {
    AKIBuilding *building = [self object];
    building._offices = [NSMutableArray object];
    
    return building;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)offices {
    return [[self copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)addOffice:(AKIOffice *)office {
    [self._offices addObject:office];
}

- (void)removeOffice:(AKIOffice *)office {
    [self._offices removeObject:office];
}

@end
