//
//  SCLPerson.m
//  SecondLecture
//
//  Created by Sapa Denys on 17.06.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import "SCLPerson.h"

@implementation SCLPerson

- (id)init
{
	self = [super init];
	if (self) {
		_firstName = @"First";
		_lastName = @"Last";
		_birthDate = [NSDate date];
	}
	return self;
}

- (NSString *)description
{
	NSString *personInfo = [NSString stringWithFormat:@"\n%@\n%@\n%@", self.firstName, self.lastName, self.birthDate];
	
	return [[super description] stringByAppendingString:personInfo];
}

@end
