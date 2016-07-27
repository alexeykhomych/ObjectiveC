//
//  AKIGCD.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 26.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIGCD.h"

void AKIAsyncPefrormInBackground(AKIGCDBlock block) {
    AKISyncPefrormInQUeue(AKIQueueTypeBackground, block);
}

void AKISyncPerformInBackground(AKIGCDBlock block) {
    AKISyncPefrormInQUeue(AKIQueueTypeBackground, block);
}

void AKIAsyncPefrormInQueue(AKIQueueType type, AKIGCDBlock block) {
    dispatch_async(AKIGetGlobalQueueWithType(type), block);
}
void AKISyncPefrormInQUeue(AKIQueueType type, AKIGCDBlock block) {
    dispatch_sync(AKIGetGlobalQueueWithType(type), block);
}

void AKIAsyncPeformInMainQueue(AKIGCDBlock block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void AKISyncPerformInMainQueue(AKIGCDBlock block) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

dispatch_queue_t AKIGetGlobalQueueWithType(AKIQueueType type) {
    return dispatch_get_global_queue(type, 0);
}
