//
//  AKIOffice.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIWorker.h"
#import "AKIBuilding.h"

@interface AKIOffice : NSObject
@property (nonatomic, copy, readonly)           NSArray     *workers;
@property (nonatomic, readonly, getter=isFull)  BOOL        full;

- (void)addWorker:(id)worker;
- (void)removeWorker:(id)worker;

- (NSArray *)freeWorkerWithClass:(Class)cls;

@end
