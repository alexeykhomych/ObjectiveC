//
//  NSTimer+AKIExtensions.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSTimer+AKIExtensions.h"
#import "AKITimer.h"

@implementation NSTimer (AKIExtensions)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(AKITimerBlock)block {
    AKITimer *timer = [[[AKITimer alloc] initWithBlock:block] autorelease];
    
    return [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                            target:timer
                                          selector:@selector(onTick:)
                                          userInfo:nil
                                           repeats:YES];
}

@end
