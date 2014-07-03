//
//  SCLDataProvider.h
//  SecondLecture
//
//  Created by Sapa Denys on 03.07.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SCLDataProvider <NSObject>

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)anObject;

- (void)addObject:(id)anObject;
- (void)removeObject:(id)anObject;

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;

@end

@interface SCLDataProvider : NSObject <SCLDataProvider>

- (instancetype)initWithContentOfFile:(NSString *)filePath;
- (instancetype)initWithArray:(NSArray *)anArray;
- (BOOL)saveToFile:(NSString *)path error:(NSError **)error;

@end
