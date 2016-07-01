//
//  AKIObservableObject.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 01.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIObservableObject.h"

@interface AKIObservableObject()
@property (nonatomic, retain) NSMutableArray *mutableObservers;

- (void)notifyObserverWithSelector:(SEL)selector;

@end

@implementation AKIObservableObject

@synthesize state = _state;

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableObservers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableObservers = [NSMutableArray new];
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)observers {
    return [[self.mutableObservers copy] autorelease];
}

- (void)setState:(NSUInteger)state {
    _state = state;
    [self notifyObserverWithSelector:[self selectorForState:state]];
}

#pragma mark -
#pragma mark Public Methods

- (void)addObservableObject:(id)object {
    [self.mutableObservers addObject:object];
}

- (void)removeObservableObject:(id)object {
    [self.mutableObservers removeObject:object];
}

- (BOOL)isObjectObservable:(id)object {
    return [self.mutableObservers containsObject:object];
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
    for (id object in self.mutableObservers) {
        if ([object respondsToSelector:selector]) {
            [object performSelector:selector withObject:object];
        }
    }
}

@end
