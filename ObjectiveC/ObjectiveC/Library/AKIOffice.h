//
//  AKIOffice.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIWorker.h"

@interface AKIOffice : NSObject

@property (nonatomic, readonly) NSArray *workers;

+ (instancetype)office;

- (void)addWorker:(AKIWorker *)worker;
- (void)removeWorker:(AKIWorker *)worker;
- (NSArray *)allWorkers;

@end
