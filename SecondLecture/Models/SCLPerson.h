//
//  SCLPerson.h
//  SecondLecture
//
//  Created by Sapa Denys on 17.06.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCLModel.h"

@interface SCLPerson : SCLModel

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, readonly) NSString *fullName;
@property (nonatomic, strong) NSDate *birthDate;
@property (nonatomic, copy) NSString *email;


- (BOOL)isEqualToPerson:(SCLPerson *)person;
- (BOOL)validateEmail:(inout NSString **)ioValue  error:(out NSError **)outErrorvali;

@end
