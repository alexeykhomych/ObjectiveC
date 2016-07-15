//
//  AKIQueue.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 20.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKICar.h"

@interface AKIQueue : NSObject
@property (nonatomic, readonly) NSArray    *queue;
@property (nonatomic, readonly) NSUInteger count;

- (void)enqueueObject:(id)object;
- (id)dequeueObject;

@end
