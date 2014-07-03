//
//  SCLModel.m
//  SecondLecture
//
//  Created by Sapa Denys on 02.07.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import "SCLModel.h"

static NSString *const kPrimitiveDictionaryKey = @"primitiveDictionary";

@interface SCLModel ()

@property (nonatomic, strong) NSMutableDictionary *primitiveDictionary;

@end

@implementation SCLModel

#pragma mark - SCLModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if (self) {
		_primitiveDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
	}
	return self;
}

- (id)init
{
	return [self initWithDictionary:nil];
}

- (NSDictionary *)primitiveValues
{
	return self.primitiveDictionary;
}

- (id)primitiveValueForKey:(NSString *)key
{
	return [self.primitiveDictionary objectForKey:key];
}

- (void)setPrimitiveValue:(id<NSCoding>)value forKey:(NSString *)key
{
	[self willChangeValueForKey:key];
	[self.primitiveDictionary setObject:value forKey:key];
	[self didChangeValueForKey:key];
}

#pragma mark - Key-Value Observing

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
	return NO;
}

#pragma mark - NSObject

- (NSUInteger)hash
{
	return self.primitiveValues.hash;
}

- (BOOL)isEqual:(id)object
{
	if (self == object) {
		return YES;
	}
	if ([self class] != [object class]) {
		return NO;
	}
	
	SCLModel *otherModel = object;
	return [self.primitiveDictionary isEqualToDictionary:otherModel.primitiveDictionary];
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
	return [self initWithDictionary:[aDecoder decodeObjectForKey:kPrimitiveDictionaryKey]];
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.primitiveDictionary forKey:kPrimitiveDictionaryKey];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
	return [[[self class] allocWithZone:zone] initWithDictionary:self.primitiveDictionary];
}

#pragma mark - TSTObservable

- (void)willChangeValueForKey:(NSString *)key
{
	[super willChangeValueForKey:key];
}

- (void)didChangeValueForKey:(NSString *)key
{
	[super didChangeValueForKey:key];
}

@end
