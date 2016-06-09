//
//  AKICreatures.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 04.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKICreatures.h"

@implementation AKICreatures

- (void)dealloc {
    self.name = nil;
    self.children = nil;
    
    [super dealloc];
}

- (instancetype)createCreature {
    id creature = [super init];
    if (creature) {
        self.children =
    }
}

- (void)sayHi {
    [self sayWithString:@"HI"];
}

- (void)sayWithString:(NSString *)string {
    NSLog(@"Creature %@ say %@", self, string);
}

- (void)birthChild {
    
}
- (void)addCreaturesToArray:(NSArray *)creaturesArray {
    
}

@end


