//
//  main.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 04.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIRunApplication.h"
#import "AKICarWash.h"
#import "NSObject+AKIExtensions.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        AKIRunApplication();
        AKICarWash *carWash = [AKICarWash object];
        for (NSUInteger i = 0; i < 10; i++) {
            [carWash performSelectorInBackground:@selector(addCarToQueue:) withObject:[AKICar object]];
        }
    }
    return 0;
}
