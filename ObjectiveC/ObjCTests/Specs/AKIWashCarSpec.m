//
//  AKIWashCarSpec.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 01.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "Kiwi.h"
#import "AKICarWash.h"
#import "NSObject+AKIExtensions.h"

SPEC_BEGIN(AKICarWashSpec)

describe(@"AKICarWash", ^{
    __block AKICarWash *carWash = nil;
    
    afterAll(^{
        carWash = nil;
    });
    
    context(@"when initialized", ^{
        carWash = [AKICarWash object];
        [carWash addCarToQueue:[AKICar object]];
    });
});

SPEC_END
