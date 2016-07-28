//
//  AKIGCD.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 26.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AKIGCDBlock)(void);

typedef enum {
    AKIQueueTypeHigh = DISPATCH_QUEUE_PRIORITY_HIGH,
    AKIQueueTypeDefault = DISPATCH_QUEUE_PRIORITY_DEFAULT,
    AKIQueueTypeBackground = DISPATCH_QUEUE_PRIORITY_BACKGROUND,
    AKIQueueyTypeLow = DISPATCH_QUEUE_PRIORITY_LOW
} AKIQueueType;

void AKIAsyncPefrormInBackground(AKIGCDBlock block);
void AKISyncPerformInBackground(AKIGCDBlock block);

void AKIAsyncPefrormInQueue(AKIQueueType type, AKIGCDBlock block);
void AKISyncPefrormInQueue(AKIQueueType type, AKIGCDBlock block);

void AKIAsyncPeformInMainQueue(AKIGCDBlock block);
void AKISyncPerformInMainQueue(AKIGCDBlock block);

dispatch_queue_t AKIGetGlobalQueueWithType(AKIQueueType type);
