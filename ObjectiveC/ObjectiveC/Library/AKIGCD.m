//
//  AKIGCD.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 26.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIGCD.h"

void AKIAsyncPefrormInBackground(AKIGCDBlock block) {
    AKIAsyncPefrormInQueue(AKIQueueTypeBackground, block);
}

void AKISyncPerformInBackground(AKIGCDBlock block) {
    AKISyncPefrormInQueue(AKIQueueTypeBackground, block);
}

void AKIAsyncPefrormInQueue(AKIQueueType type, AKIGCDBlock block) {
    if (!block) {
        return;
    }
    
    dispatch_async(AKIGetGlobalQueueWithType(type), block);
}
void AKISyncPefrormInQueue(AKIQueueType type, AKIGCDBlock block) {
    if (!block) {
        return;
    }
    
    dispatch_sync(AKIGetGlobalQueueWithType(type), block);
}

void AKIAsyncPeformInMainQueue(AKIGCDBlock block) {
    if (!block) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), block);
}

void AKISyncPerformInMainQueue(AKIGCDBlock block) {
    if (!block) {
        return;
    }
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

dispatch_queue_t AKIGetGlobalQueueWithType(AKIQueueType type) {
    return dispatch_get_global_queue(type, 0);
}
