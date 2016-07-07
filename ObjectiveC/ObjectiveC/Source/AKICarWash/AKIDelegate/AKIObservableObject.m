//
//  AKIObservableObject.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 01.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIObservableObject.h"

@interface AKIObservableObject()
@property (nonatomic, retain) NSHashTable *observersTable;

- (void)notifyObserverWithSelector:(SEL)selector;
- (void)notifyObserverWithSelector:(SEL)selector object:(id)object;
- (SEL)selectorForState:(NSUInteger)state;

@end

@implementation AKIObservableObject

@dynamic observers;
@synthesize state = _state;

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.observersTable = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.observersTable = [NSHashTable weakObjectsHashTable];
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSSet *)observers {
    return self.observersTable.setRepresentation;
}

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:self];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    if (_state != state) {
        _state = state;
        
        [self notifyOfState:state WithObject:object];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)object {
    if (object) {
        [self.observersTable addObject:object];
    }
}

- (void)addObservers:(NSArray *)observers {
    for (id observer in observers) {
        [self addObserver:observer];
    }
}

- (void)removeObserver:(id)object {
    [self.observersTable removeObject:object];
}

- (void)removeObservers {
    [self.observersTable removeAllObjects];
}

- (BOOL)containsObserver:(id)object {
    return [self.observersTable containsObject:object];
}

- (void)notifyOfState:(NSUInteger)state {
    [self notifyOfState:state WithObject:self];
}

- (void)notifyOfState:(NSUInteger)state WithObject:(id)object {
    [self notifyObserverWithSelector:[self selectorForState:state]];
}

#pragma mark -
#pragma mark Private Methods

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;	
}

- (void)notifyObserverWithSelector:(SEL)selector {
    [self notifyObserverWithSelector:selector object:self];
}

- (void)notifyObserverWithSelector:(SEL)selector object:(id)object {
    NSHashTable *observers = self.observersTable;
    
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}

@end
