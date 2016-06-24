//
//  AKICar.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 15.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIMoney.h"

@interface AKICar : NSObject <AKIMoney>
@property (nonatomic, assign, getter=isClear) BOOL clean;

@end
