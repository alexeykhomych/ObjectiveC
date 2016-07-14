//
//  AKIQueue.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 20.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIQueue.h"
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
    @synchronized (self) {
        return [[self.mutableQueue copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)enqueueObject:(id)object {
    @synchronized (self) {
        [self.mutableQueue addObject:object];
    }
}

- (id)dequeueObject {
    @synchronized (self) {
        NSMutableArray *array = self.mutableQueue;
        id object = [[[array firstObject] retain] autorelease];
        [array removeObject:object];
        
        return object;
    }
}

- (NSUInteger)countOfQueue:(NSMutableArray *)queue {
    @synchronized (self) {
        return [queue count];
    }
}

@end
