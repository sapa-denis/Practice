//
//  SCLDataProvider.m
//  SecondLecture
//
//  Created by Sapa Denys on 03.07.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import "SCLDataProvider.h"

static void *SCLDataProviderObserverContext = &SCLDataProviderObserverContext;

@interface SCLDataProvider ()

@property (nonatomic, strong) NSMutableArray *backingArray;

@end

@implementation SCLDataProvider

#pragma mark - SCLDataProvider Methods

- (instancetype)initWithContentOfFile:(NSString *)filePath
{
	NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
	return [self initWithArray:array];
}

- (instancetype)initWithArray:(NSArray *)anArray
{
	self = [super init];
	if (self) {
		_backingArray = [NSMutableArray arrayWithArray:anArray];
	}
	return self;
}

- (BOOL)saveToFile:(NSString *)path error:(NSError **)error
{
	NSData *saveData = [NSKeyedArchiver archivedDataWithRootObject:self.backingArray];
	return [saveData writeToFile:path options:NSDataWritingAtomic error:error];
}

#pragma mark - SCLDataProvider Protocol Methods

- (NSUInteger)count
{
	return [self.proxyObjects count];
}

- (id)objectAtIndex:(NSUInteger)index
{
	return self.proxyObjects[index];
}

- (void)addObject:(id)anObject
{
	[self.proxyObjects addObject:anObject];
}

- (void)removeObject:(id)anObject
{
	[self.proxyObjects removeObject:anObject];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
	[self.proxyObjects insertObject:anObject atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
	[self.proxyObjects removeObjectAtIndex:index];
}

#pragma mark - Key-Value Coding

- (NSUInteger)countOfObjects
{
	return [self.backingArray count];
}

- (NSArray *)objectsAtIndexes:(NSIndexSet *)indexes
{
	return [self.backingArray objectsAtIndexes:indexes];
}

- (void)insertObjects:(NSArray *)array atIndexes:(NSIndexSet *)indexes
{
	[self.backingArray insertObjects:array atIndexes:indexes];
}

- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes
{
	[self.backingArray removeObjectsAtIndexes:indexes];
}

- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withBackingArray:(NSArray *)array
{
	[self.backingArray replaceObjectsAtIndexes:indexes withObjects:array];
}

- (NSMutableArray *)proxyObjects
{
	return [self mutableArrayValueForKey:@"objects"];
}

@end
