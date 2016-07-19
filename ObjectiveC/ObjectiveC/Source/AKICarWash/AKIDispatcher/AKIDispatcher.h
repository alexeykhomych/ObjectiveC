//
//  AKIDispatcher.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 18.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AKIQueue;

@interface AKIDispatcher : NSObject
@property (nonatomic, readonly) NSArray     *processors;

+ (instancetype)initDispatcherWithProcessor:(NSArray *)processors;

- (instancetype)initWithProcessors:(NSArray *)processors;

- (void)processObject:(id)object;

- (void)addProcessors:(NSArray *)processors;
- (void)removeProcessors:(NSArray *)processors;

- (void)addProcessor:(id)processor;
- (void)removeProcessor:(id)processor;

@end
