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

- (BOOL)containsProcessor:(id)processor;
- (id)reservedWorker;
- (NSArray *)freeWorkers;
- (void)processing;

@end

@implementation AKIDispatcher

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableProcessors = nil;
    self.processingObjects = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableProcessors = [NSMutableArray new];
    self.processingObjects = [AKIQueue object];
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)processors {
    return [[self.mutableProcessors copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addProcessor:(id)processor {
    [self.mutableProcessors addObject:processor];
}

- (void)removeProcessor:(id)processor {
    [self.mutableProcessors removeObject:processor];
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
    AKIQueue *queue = self.processingObjects;
    [queue enqueueObject:object];
    
    [self performSelectorInBackground:@selector(processing) withObject:nil];
}

#pragma mark -
#pragma mark Private Methods

- (void)processing {
    AKIQueue *queue = self.processingObjects;
    id processedObject = [queue dequeueObject];
    
    if (!processedObject) {
        return;
    }
    
    id processor = [self reservedWorker];
    
    if (processor) {
        [processor processObject:processedObject];
    } else {
        [queue enqueueObject:processedObject];
    }
}

- (BOOL)containsProcessor:(id)processor {
    return [self.mutableProcessors containsObject:processor];
}

- (id)reservedWorker{
    AKIWorker *worker = [[self freeWorkers] firstObject];
    worker.state = AKIWorkerBusy;
    
    return worker;
}

- (NSArray *)freeWorkers {
    @synchronized (self) {
        return [self.mutableProcessors filterWithBlock:^BOOL(AKIWorker *worker) { return worker.state != AKIWorkerBusy; }];
    }
}

#pragma mark -
#pragma mark Observer Methods

- (void)workerDidBecomePending:(id)worker {
    if (![self containsProcessor:worker]) {
        [self processObject:worker];
    }
}

- (void)workerDidBecomeFree:(AKIWorker *)worker {
    @synchronized (worker) {
        if ([self containsProcessor:worker]) {
            [self performSelectorInBackground:@selector(processing) withObject:nil];
        }
    }
}

@end
