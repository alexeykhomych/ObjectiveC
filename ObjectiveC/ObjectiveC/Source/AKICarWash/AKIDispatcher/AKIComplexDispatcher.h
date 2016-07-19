//
//  AKIComplexDispatcher.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 18.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKICarWash.h"

@interface AKIComplexDispatcher : NSObject
@property (nonatomic, assign, getter=isRunning) BOOL        running;
@property (nonatomic, readonly)                 AKICarWash  *carWash;

+ (instancetype)initWithComplex:(AKICarWash *)complex;

- (instancetype)initWithComplex:(AKICarWash *)complex;

- (void)washCar;

@end
