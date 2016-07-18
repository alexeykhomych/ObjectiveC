//
//  AKIDispatcher.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 18.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIQueue.h"

@interface AKIDispatcher : NSObject
@property (nonatomic, readonly) AKIQueue    *processingObjects;
@property (nonatomic, readonly) NSArray     *processors;
@property (nonatomic, readonly) NSString    *name;

- (instancetype)init;

- (void)processObject:(id)object;

- (void)addProcessors:(NSArray *)processors;
- (void)removeProcessors:(NSArray *)processors;

- (void)addProcessor:(id)processor;
- (void)removeProcessor:(id)processor;

@end
