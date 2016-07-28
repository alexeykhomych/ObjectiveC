//
//  AKITimer.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKITimer.h"

@implementation AKITimer

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [super dealloc];
}

- (instancetype)initWithBlock:(AKITimerBlock)block {
    self = [super init];
    if (block) {
        self.block = block;
    }
    
    return self;
}

- (void)onTick:(NSTimer *)timer {
    self.block();
}

@end
