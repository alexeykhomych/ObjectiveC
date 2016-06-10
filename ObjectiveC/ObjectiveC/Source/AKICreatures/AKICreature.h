//
//  AKICreature.h
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
}AKIGender;

@interface AKICreature : NSObject

@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSUInteger  weight;
@property (nonatomic, assign)   NSUInteger  age;
@property (nonatomic, readonly) NSArray     *children;
@property (nonatomic, assign)   AKIGender   gender;

- (instancetype)initCreature;
- (void)sayPhrase:(NSString *)sentence;
- (void)addChild:(AKICreature *)creature;
- (void)removeChild:(AKICreature *)creature;
- (void)performGenderSpecificOperation;

@end
