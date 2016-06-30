//
//  AKIDelegate.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 30.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIDelegate.h"

@implementation AKIDelegate

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.delegatingObject = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors Methods

- (void)setDelegatingObject:(AKIDelegatingObject *)delegatingObject {
    if (_delegatingObject != delegatingObject) {
        _delegatingObject.delegate = nil;
        [_delegatingObject release];
        _delegatingObject = [delegatingObject retain];
    
        _delegatingObject.delegate = self;
    }
}

#pragma mark -
#pragma mark DelegatingObjectDelegate

- (void)delegatingObject:(AKIDelegatingObject *)object didChangeState:(NSUInteger)state {
    
}

- (BOOL)delegatingObjectShouldChangeState:(AKIDelegatingObject *)object {
    return YES;
}

@end
