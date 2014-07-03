//
//  SCLModel.h
//  SecondLecture
//
//  Created by Sapa Denys on 02.07.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const SCLModelChangedKey;

@interface SCLModel : NSObject <NSCopying, NSCoding>

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)primitiveValues;
- (id)primitiveValueForKey:(NSString *)key;
- (void)setPrimitiveValue:(id<NSCoding>)value forKey:(NSString *)key;

@end
