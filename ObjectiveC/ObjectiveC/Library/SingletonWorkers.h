//
//  SingletonWorkers.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 16.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonWorkers : NSObject
@property (nonatomic, assign) NSMutableArray *workers;

+(instancetype) sharedInstance;

+(instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));

@end
