//
//  SCLPersonDescriptionFormatter.m
//  SecondLecture
//
//  Created by Sapa Denys on 21.06.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import "SCLPersonDescriptionFormatter.h"
#import "SCLPerson.h"

@interface SCLPersonDescriptionFormatter ()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation SCLPersonDescriptionFormatter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dateFormatter = [NSDateFormatter new];
		[_dateFormatter setDateFormat:@"EEE, dd MMM YYYY"];
    }
    return self;
}

- (NSString *)descriptionStringFromPerson:(SCLPerson *)person
{
	NSString *formattedBirthDate = [self.dateFormatter stringFromDate:person.birthDate];
	NSString *personInfo = [NSString stringWithFormat:@"%@\n%@\n%@", person.firstName, person.lastName, formattedBirthDate];
	return personInfo;
}

@end
