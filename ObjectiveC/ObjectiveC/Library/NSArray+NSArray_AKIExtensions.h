//
//  NSArray+NSArray_AKIExtensions.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 07.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^ArrayFilterBlock)(id object);

@interface NSArray (NSArray_AKIExtensions)

- (NSArray *)filterWithBlock:(ArrayFilterBlock)block;

@end
