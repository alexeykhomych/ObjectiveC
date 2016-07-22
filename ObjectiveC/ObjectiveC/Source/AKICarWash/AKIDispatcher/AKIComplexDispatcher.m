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
    @synchronized (self) {
        if (_timer != timer) {
            [_timer invalidate];
            _timer = timer;
        }
    }
}

- (void)setRunning:(BOOL)running {
    @synchronized (self) {
        if (_running != running) {
            _running = running;
            SEL selector = running ? @selector(initTimer) : @selector(invalidate);
            
            [self performSelectorOnMainThread:selector withObject:nil waitUntilDone:NO];
        }
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)washCar {
    @synchronized (self) {
        AKICarWash *complex = self.carWash;
        for (NSUInteger i = 0; i < kAKIMaxCarCount; i++) {
            [complex performSelectorInBackground:@selector(washCar:) withObject:[AKICar object]];
        }
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)initTimer {
    @synchronized (self) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:kAKITimer
                                                      target:self
                                                    selector:@selector(washCar)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

@end
