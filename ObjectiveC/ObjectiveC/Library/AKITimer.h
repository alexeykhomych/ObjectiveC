//
//  AKITimer.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AKITimerBlock)(void);

@interface AKITimer : NSObject
@property (nonatomic, assign) AKITimerBlock block;

- (instancetype)initWithBlock:(AKITimerBlock)block;

- (void)onTick:(NSTimer *)timer;

@end
