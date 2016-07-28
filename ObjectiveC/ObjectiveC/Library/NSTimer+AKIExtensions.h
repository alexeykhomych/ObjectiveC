//
//  NSTimer+AKIExtensions.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AKITimerBlock)(void);

@interface NSTimer (AKIExtensions)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(AKITimerBlock)block;

@end
