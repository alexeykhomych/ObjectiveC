//
//  AKICreatures.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 04.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    AKIGenderNotDefined,
    AKIGenderMale,
    AKIGenderFemale
} AKIGender;

@interface AKICreatures : NSObject {
@public
    NSObject *_publicObject;
}

@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, assign) NSUInteger weight;
@property (nonatomic, readwrite, retain) NSString *name;
@property (nonatomic, retain) NSArray *children;

@property (readonly) Class superclass;


- (instancetype)createCreature;

- (void)sayHi;
- (void)sayWithString:(NSString *)string;
- (void)birthChild;
- (void)addCreaturesToArray:(AKICreatures *)child:(AKICreatures *)creature;


@end
