//
//  AKIWorker.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIMoney.h"

@interface AKIWorker : NSObject <AKIMoney>
@property (nonatomic, assign)                   NSUInteger  salary;
@property (nonatomic, assign)                   NSUInteger  experience;
@property (nonatomic, assign, getter=isFree)    BOOL        free;

- (void)processObject:(id)object;

@end
