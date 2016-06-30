//
//  AKIDelegatingObject.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 30.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AKIDelegatingObject;

@protocol AKIDelegatingObjectDelegate <NSObject>

- (void)delegatingObject:(AKIDelegatingObject *)object didChangeState:(NSUInteger)state;

@optional
- (BOOL)delegatingObjectShouldChangeState:(AKIDelegatingObject *)object;

@end

@interface AKIDelegatingObject : NSObject
@property (nonatomic, assign) NSUInteger state;
@property (nonatomic, assign) id<AKIDelegatingObjectDelegate> delegate;

@end
