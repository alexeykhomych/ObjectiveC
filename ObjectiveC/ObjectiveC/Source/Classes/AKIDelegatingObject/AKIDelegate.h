//
//  AKIDelegate.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 30.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIDelegatingObject.h"

@interface AKIDelegate : NSObject <AKIDelegatingObjectDelegate>
@property (nonatomic, retain) AKIDelegatingObject *delegatingObject;

@end
