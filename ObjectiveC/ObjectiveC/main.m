//
//  main.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 04.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKICarWash.h"
#import "NSObject+AKIExtensions.h"

static const NSUInteger kAKIMaxIterationCount = 1000;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AKICarWash *carWash = [AKICarWash object];
        for (NSUInteger i = 0; i < kAKIMaxIterationCount; i++) {
            [carWash performSelectorInBackground:@selector(addCarToQueue:) withObject:[AKICar object]];
        }
        
        [[NSRunLoop mainRunLoop] run];
    }
    
    return 0;
}
