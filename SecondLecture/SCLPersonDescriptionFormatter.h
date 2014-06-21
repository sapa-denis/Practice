//
//  SCLPersonDescriptionFormatter.h
//  SecondLecture
//
//  Created by Sapa Denys on 21.06.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCLPerson;

@interface SCLPersonDescriptionFormatter : NSObject

- (NSString *)descriptionStringFromPerson:(SCLPerson *)person;

@end
