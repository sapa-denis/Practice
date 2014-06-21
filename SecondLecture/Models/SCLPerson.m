//
//  SCLPerson.m
//  SecondLecture
//
//  Created by Sapa Denys on 17.06.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import "SCLPerson.h"

static NSString *const kFirstName = @"firstName";
static NSString *const kLastName = @"lastName";
static NSString *const kBirthDate = @"birthDate";

@interface SCLPerson ()

@property (nonatomic, strong) NSMutableDictionary *modelDictionnary;

@end

@implementation SCLPerson

- (id)init
{
	self = [super init];
	if (self) {
		_modelDictionnary = [NSMutableDictionary new];
	}
	return self;
}

- (void)setFirstName:(NSString *)firstName
{
	[self.modelDictionnary setObject:firstName forKey:kFirstName];
}

- (NSString *)firstName
{
	return [self.modelDictionnary objectForKey:kFirstName];
}

- (void)setLastName:(NSString *)lastName
{
	[self.modelDictionnary setObject:lastName forKey:kLastName];
}

- (NSString *)lastName
{
	return [self.modelDictionnary objectForKey:kLastName];
}

- (void)setBirthDate:(NSDate *)birthDate
{
	[self.modelDictionnary setObject:birthDate forKey:kBirthDate];
}

- (NSDate *)birthDate
{
	return [self.modelDictionnary objectForKey:kBirthDate];
}

- (NSString *)description
{	
	NSString *personInfo = [NSString stringWithFormat:@"\n%@\n%@\n%@", self.firstName, self.lastName, self.birthDate];
	
	return [[super description] stringByAppendingString:personInfo];
}

@end
