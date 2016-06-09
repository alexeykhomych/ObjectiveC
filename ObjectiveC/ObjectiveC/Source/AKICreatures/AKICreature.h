//
//  AKICreatures.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 04.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 Есть существо, у существа есть typedef пола, есть строка имени, есть масса, есть возраст, есть массив детей. Существо умеет воевать и рожать детей. При родах существо не добавляет к себе ребенка автоматом. Существо умеет добавит к себе детей и удалить. Существо умеет говорить "Привет!", причем, когда существо говорит привет, то сначала говорит оно, а потом все его дети (значит и дети детей, и т.д.).
 */

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
@property (nonatomic, retain) NSString *name;
@property (nonatomic, readonly,retain) NSArray *children;

@property (readonly) Class superclass;


- (instancetype)createCreature;

- (void)sayHi;
- (void)sayWithString:(NSString *)string;
- (void)birthChild;
- (void)addCreaturesToArray:(AKICreatures *)child:(AKICreatures *)creature;


@end
