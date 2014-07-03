//
//  SCLObservable.h
//  SecondLecture
//
//  Created by Sapa Denys on 03.07.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SCLListener <NSObject>

@optional

- (void)observableObjectWillChangeContent:(id <SCLObservable>)observable userInfo:(NSMutableDictionary *)userInfo;

@end


@protocol SCLObservable <NSObject>

- (void)addListener:(id <TSTListener>)listener;

- (void)removeListener:(id <TSTListener>)listener;

@end
