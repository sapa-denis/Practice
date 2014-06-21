//
//  SCLPerson.h
//  SecondLecture
//
//  Created by Sapa Denys on 17.06.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCLPerson : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) NSDate *birthDate;

@end
