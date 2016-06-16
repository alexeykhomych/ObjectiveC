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

@interface AKIOffice()
//@property (nonatomic, retain) NSMutableDictionary    *mutableWorkers;

@end

@implementation AKIOffice

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
//    self.workers = nil;
    
    [super dealloc];
}

+ (instancetype)office {
    AKIOffice *office = [super object];
//    office.workers = [NSMutableDictionary object];
    
    return office;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)workers {
    return [[self copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

@end
