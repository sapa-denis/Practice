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
static NSString *const kEmailKey = @"email";

static NSString *const kSCLPersonErrorDomain = @"TSTPersonErrorDomain";

typedef NS_ENUM(NSInteger, SCLPersonErrorDomain) {
	SCLPersonErrorEmailCode
};

@interface SCLPerson ()


@end

//Blah-blah-blah


@implementation SCLPerson

#pragma mark - NSObject

- (id)init
{
	self = [super init];
	if (self) {
		
	}
	return self;
}

#pragma mark - SCLPerson

- (BOOL)isEqualToPerson:(SCLPerson *)person
{
	NSAssert([person isMemberOfClass:[SCLPerson class]], @"class");
	return [[self primitiveValues] isEqualToDictionary:[person primitiveValues]];
}

- (void)setFirstName:(NSString *)firstName
{
	[self setPrimitiveValue:[firstName copy] forKey:kFirstName];
}

- (NSString *)firstName
{
	return [self primitiveValueForKey:kFirstName];
}

- (void)setLastName:(NSString *)lastName
{
	[self setPrimitiveValue:[lastName copy] forKey:kLastName];
}

- (NSString *)lastName
{
	return [self primitiveValueForKey:kLastName];
}

- (NSString *)fullName
{
	return [NSString stringWithFormat:@"%@%@%@", self.firstName, self.firstName.length ? @" ": @"", self.lastName];
}

- (void)setBirthDate:(NSDate *)birthDate
{
	[self setPrimitiveValue:[birthDate copy] forKey:kBirthDate];
}

- (NSDate *)birthDate
{
	return [self primitiveValueForKey:kBirthDate];
}

- (NSString *)email
{
	return [self primitiveValueForKey:kEmailKey];
}

- (void)setEmail:(NSString *)email
{
	[self setPrimitiveValue:[email copy] forKey:kEmailKey];
}


- (BOOL)validateEmail:(inout NSString **)ioValue error:(out NSError **)outErrorvali
{
	void(^setError)(void) = ^{
		if (outErrorvali != NULL) {
			NSString *errorString = NSLocalizedString(@"A Person's email must be at least three characters long", @"validation: Person, too short name error");
			NSDictionary *userInfoDic = @{NSLocalizedDescriptionKey : errorString};
			*outErrorvali = [[NSError alloc] initWithDomain:kSCLPersonErrorDomain
													   code:SCLPersonErrorEmailCode
												   userInfo:userInfoDic];
		}
	};
	
	//The email must not be nil
	if ((*ioValue == nil) || [*ioValue length] < 3) {
		setError();
		return NO;
	}
	
	NSRange entireRange = NSMakeRange(0, [*ioValue length]);
	NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:NULL];
	NSArray *matches = [detector matchesInString:*ioValue options:0 range:entireRange];
	
	// should only single match
	if ([matches count] != 1) {
		setError();
		return NO;
	}
	
	NSTextCheckingResult *checkingResult = [matches firstObject];
	
	// result should be a link
	if (checkingResult.resultType != NSTextCheckingTypeLink) {
		setError();
		return NO;
	}
	
	// result should be a recognized mail address
	if (![checkingResult.URL.scheme isEqualToString:@"mailto"]) {
		setError();
		return NO;
	}
	
	// match must be entire string
	if (!NSEqualRanges(checkingResult.range, entireRange)) {
		setError();
		return NO;
	}
	
	// but should not have the mail URL scheme
	if ([*ioValue hasPrefix:@"mailto:"]) {
		setError();
		return NO;
	}
	
	*ioValue = [[*ioValue lowercaseString] stringByTrimmingCharactersInSet:
				[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	return YES;
}

#pragma mark - Key-Value Observing

+ (NSSet *)keyPathsForValuesAffectingFullName
{
	return [NSSet setWithArray:@[@"firstName", @"lastName"]];
}

@end
