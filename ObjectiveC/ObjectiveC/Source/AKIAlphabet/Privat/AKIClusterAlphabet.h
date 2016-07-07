//
//  AKIClusterAlphabet.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 24.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAlphabet.h"

@interface AKIClusterAlphabet : AKIAlphabet
@property (nonatomic, readonly) NSArray *alphabets;

- (instancetype)initWithAlphabets:(NSArray *)alphabets;

@end
