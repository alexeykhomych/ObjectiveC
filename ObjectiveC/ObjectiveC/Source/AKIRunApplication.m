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
#import "AKICarWashWorkerTest.h"
#import "AKIWorker.h"

void AKIRunApplication() {
//    id testCreature = [[[AKICreatureTest alloc] init]  autorelease];
//    [testCreature performTest];
    
    id testWorker = [[[AKICarWashWorkerTest alloc] init] autorelease];
    [testWorker performWorkerTest];
}