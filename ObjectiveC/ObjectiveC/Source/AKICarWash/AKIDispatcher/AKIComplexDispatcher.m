//
//  AKIComplexDispatcher.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 18.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIComplexDispatcher.h"
#import "NSObject+AKIExtensions.h"
#import "AKIGCD.h"

static const NSUInteger kAKITimer = 3;
static const size_t kAKIMaxCarCount = 5;

@interface AKIComplexDispatcher()
@property (nonatomic, assign) NSTimer       *timer;
@property (nonatomic, retain) AKICarWash    *carWash;

@end

@implementation AKIComplexDispatcher

#pragma mark -
#pragma mark Class Methods

+ (instancetype)initWithComplex:(AKICarWash *)complex {
    return [[[self alloc] initWithComplex:complex] autorelease];
}

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.timer = nil;
    self.carWash = nil;
    
    [super dealloc];
}

- (instancetype)initWithComplex:(AKICarWash *)complex {
    self = [super init];
    self.carWash = complex;
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        [_timer invalidate];
        _timer = timer;
    }
}

- (void)setRunning:(BOOL)running {
    if (_running != running) {
        _running = running;
        SEL selector = running ? @selector(initTimer) : @selector(invalidate);
        [self performSelector:selector];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)washCar {
    AKICarWash *complex = self.carWash;

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(kAKIMaxCarCount, queue, ^(size_t count) {
        AKIAsyncPefrormInBackground(^{
            [complex washCar:[AKICar object]];
        });
    });
}

#pragma mark -
#pragma mark Private Methods

- (void)initTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kAKITimer
                                                  target:self
                                                selector:@selector(washCar)
                                                userInfo:nil
                                                 repeats:YES];
}

@end
