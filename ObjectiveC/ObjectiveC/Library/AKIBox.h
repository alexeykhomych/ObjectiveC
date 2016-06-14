//
//  AKIBox.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIOffice.h"
#import "AKIWasher.h"

@interface AKIBox : AKIOffice
@property (nonatomic, readonly) AKIWasher *washer;
@property (nonatomic, readonly) id car;

@end
