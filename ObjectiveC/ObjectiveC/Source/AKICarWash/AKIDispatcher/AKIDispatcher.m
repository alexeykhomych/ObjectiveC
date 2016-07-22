//
//  AKIDispatcher.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 18.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIDispatcher.h"
#import "NSObject+AKIExtensions.h"
#import "NSArray+AKIExtensions.h"
#import "AKIWorker.h"

@interface AKIDispatcher()
@property (nonatomic, retain) NSMutableArray    *mutableProcessors;
@property (nonatomic, retain) AKIQueue          *processingObjects;
@property (nonatomic, retain) AKIQueue          *freeProcessors;

- (BOOL)containsProcessor:(id)processor;
- (id)reservedWorker;
- (NSArray *)freeWorkers;

@end

@implementation AKIDispatcher

#pragma mark -
#pragma mark Class Methods

+ (instancetype)initDispatcherWithProcessor:(NSArray *)processors {
    return [[[self alloc] initWithProcessors:processors] autorelease];
}

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableProcessors = nil;
    self.processingObjects = nil;
    
    [super dealloc];
}

- (instancetype)initWithProcessors:(NSArray *)processors {
    self = [super init];
    self.mutableProcessors = [NSMutableArray new];
    self.processingObjects = [AKIQueue object];
    
    [self addProcessors:processors];
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)processors {
    @synchronized (self) {
        return [[self.mutableProcessors copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addProcessor:(id)processor {
    @synchronized (self) {
        [self.mutableProcessors addObject:processor];
    }
}

- (void)removeProcessor:(id)processor {
    @synchronized (self) {
        [self.mutableProcessors removeObject:processor];
    }
}

- (void)addProcessors:(NSArray *)processors {
    for (id processor in processors) {
        [self addProcessor:processor];
    }
}

- (void)removeProcessors:(NSArray *)processors {
    for (id processor in processors) {
        [self removeProcessor:processor];
    }
}

- (void)processObject:(id)object {
    if (object) {
        AKIWorker *worker = [self reservedWorker];
        [worker processObject:object];
    }
}

#pragma mark -
#pragma mark Private Methods

- (BOOL)containsProcessor:(id)processor {
    @synchronized (self) {
        return [self.mutableProcessors containsObject:processor];
    }
}

- (id)reservedWorker{
    @synchronized (self) {
        AKIWorker *worker = [[self freeWorkers] firstObject];
        worker.state = AKIWorkerBusy;
        
        return worker;
    }
}

- (NSArray *)freeWorkers {
    @synchronized (self) {
        return [self.mutableProcessors filterWithBlock:^BOOL(AKIWorker *worker) { return worker.state != AKIWorkerBusy; }];
    }
}

#pragma mark -
#pragma mark Observer Methods

- (void)workerDidBecomePending:(id)object {
    @synchronized (self) {
        AKIWorker *worker = object;
        
        if (![self containsProcessor:worker]) {
            [self processObject:worker];
        }
    }
}

- (void)workerDidBecomeFree:(id)object {
    AKIWorker *worker = object;
    
    if ([self containsProcessor:worker]) {
        [self performSelectorInBackground:@selector(processObject:) withObject:worker];
    }
}

@end
