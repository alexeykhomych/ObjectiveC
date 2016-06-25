//
//  AKIQueue.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 20.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIQueue.h"
#import "AKIBuilding.h"
#import "AKIWorker.h"

@interface AKIQueue()
@property (nonatomic, retain) NSMutableArray *mutableQueue;

@end

@implementation AKIQueue

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableQueue = [NSMutableArray array];
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)queue {
    return [[self.mutableQueue copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)enqueueObject:(id)object {
    [self.mutableQueue addObject:object];
}

- (id)dequeueObject {
    NSMutableArray *array = [[self.queue copy] autorelease];
    id object = [[[array firstObject] retain] autorelease];
    [array removeObject:[array firstObject]];
    
    return object;
}

@end
