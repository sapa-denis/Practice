//
//  SCLDataProvider+SCLFileUtils.m
//  SecondLecture
//
//  Created by Sapa Denys on 03.07.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import "SCLDataProvider+SCLFileUtils.h"
#import "SCLPerson.h"

static NSString *SCLSavePaht()
{
	return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"contacts"];
}

@implementation SCLDataProvider (SCLFileUtils)

+ (SCLDataProvider *)testDataProvider
{
	NSString *path = SCLSavePaht();
	
	if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
		return [[SCLDataProvider alloc] initWithContentOfFile:path];
	} else {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
		
		NSArray *contactDictionaries = [NSArray arrayWithContentsOfFile:path];
		NSMutableArray *contacts = [NSMutableArray arrayWithCapacity:contactDictionaries.count];
		
		for (NSDictionary *dictionary in contactDictionaries) {
			[contacts addObject:[[SCLPerson alloc] initWithDictionary:dictionary]];
		}
		return [[SCLDataProvider alloc] initWithArray:contacts];
	}
}

- (void)testSave
{
	[self saveToFile:SCLSavePaht() error:nil];
}

@end
