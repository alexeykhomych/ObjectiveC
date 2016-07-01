//
//  AKIObservableObject.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 01.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKIObservableObject : NSObject
@property (nonatomic, readonly) NSArray     *observers;
@property (nonatomic, assign)   NSUInteger  state;

- (void)addObservableObject:(id)object;
- (void)removeObservableObject:(id)object;
- (BOOL)isObservedByObject:(id)object;

- (SEL)selectorForState:(NSUInteger) state;

@end
