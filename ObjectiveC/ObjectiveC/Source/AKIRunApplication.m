//
//  AKIRunApplication.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 04.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIRunApplication.h"
#import "AKICreatureTest.h"

void AKIRunApplication() {
    id test = [[AKICreatureTest alloc] init];
    [test AKICreatureTestCreate];
}