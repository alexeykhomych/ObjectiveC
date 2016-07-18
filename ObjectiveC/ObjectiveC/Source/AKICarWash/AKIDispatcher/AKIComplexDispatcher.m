//
//  AKIComplexDispatcher.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 18.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIComplexDispatcher.h"
#import "NSObject+AKIExtensions.h"

static const NSUInteger kAKITimer = 3;
static const NSUInteger kAKIMaxCarCount = 500;

@interface AKIComplexDispatcher()
@property (nonatomic, assign) NSTimer       *timer;
@property (nonatomic, retain) AKICarWash    *carWash;

@end

@implementation AKIComplexDispatcher

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
        if (running) {
            [self performSelectorOnMainThread:@selector(initTimer) withObject:nil waitUntilDone:YES];
        } else {
            [self.timer performSelectorOnMainThread:@selector(invalidate) withObject:nil waitUntilDone:YES];
        }
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)transferCars {
    NSArray *cars = [self cars];
    for (AKICar *car in cars) {
        [self.carWash performSelectorInBackground:@selector(addCarToQueue:) withObject:car];
    }
}

#pragma mark -
#pragma mark Private Methods

- (NSArray *)cars {
    return nil;
}

- (void)initTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kAKITimer
                                                  target:self
                                                    selector:@selector(transferCars)
                                                    userInfo:nil
                                                    repeats:YES];
}

@end
