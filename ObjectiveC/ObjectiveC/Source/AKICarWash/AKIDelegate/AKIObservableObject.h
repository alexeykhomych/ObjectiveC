//
//  AKIObservableObject.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 01.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKIObservableObject : NSObject
@property (nonatomic, readonly) NSSet       *observers;
@property (nonatomic, assign)   NSUInteger  state;
- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)addObserver:(id)object;
- (void)addObservers:(NSArray *)observers;
- (void)removeObserver:(id)object;
- (void)removeObservers:(NSArray *)observers;
- (BOOL)containsObserver:(id)object;

- (SEL)selectorForState:(NSUInteger) state;

- (void)notifyOfState:(NSUInteger)state withObject:(id)object;

@end
