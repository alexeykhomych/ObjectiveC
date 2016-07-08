//
//  NSArray+AKIExtensions.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 07.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^AKIArrayFilterBlock)(id object);

@interface NSArray (AKIExtensions)

- (NSArray *)filterWithBlock:(AKIArrayFilterBlock)block;

@end
