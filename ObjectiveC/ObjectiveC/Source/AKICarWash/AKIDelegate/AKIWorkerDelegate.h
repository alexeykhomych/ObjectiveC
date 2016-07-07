//
//  AKIWorkerDelegate.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 01.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AKIWorker;
@protocol AKIWorkerDelegate <NSObject>

- (void)workerDidFinishProccesingObject:(AKIWorker *)worker;

@end
