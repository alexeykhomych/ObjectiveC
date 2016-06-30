//
//  AKIDelegatingObject.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 30.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIDelegatingObject.h"

@implementation AKIDelegatingObject

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Dealocations

#pragma mark -
#pragma mark Accessors Methods

- (void)setState:(NSUInteger)state {
    BOOL shouldChanges = YES;
    
    id<AKIDelegatingObjectDelegate> delegate = self.delegate;
    
    if ([delegate respondsToSelector:@selector(delegatingObjectShouldChangeState:)]) {
        shouldChanges = [delegate delegatingObjectShouldChangeState:self];
    }
    
    if (shouldChanges) {
        _state = state;
        [delegate delegatingObject:self didChangeState:state];
    }
}

#pragma mark -
#pragma mark Public Methods

#pragma mark -
#pragma mark Private Methods


@end
