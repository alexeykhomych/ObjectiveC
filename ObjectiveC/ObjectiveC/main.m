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
#import "AKIComplexDispatcher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AKIComplexDispatcher *complexDispatcher = [AKIComplexDispatcher initWithComplex:[AKICarWash object]];
        [complexDispatcher washCar];
        [complexDispatcher setRunning:YES];
        
        [[NSRunLoop mainRunLoop] run];
    }
    
    return 0;
}
