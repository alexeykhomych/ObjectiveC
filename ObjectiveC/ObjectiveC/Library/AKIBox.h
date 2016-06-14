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
@property (nonatomic, assign)                 AKIWasher   *washer;
@property (nonatomic, assign)                 id          car;
@property (nonatomic, assign, getter=isFull)    BOOL        Full;
@end
