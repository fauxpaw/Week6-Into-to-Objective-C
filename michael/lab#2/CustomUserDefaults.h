//
//  CustomUserDefaults.h
//  lab#2
//
//  Created by Michael Sweeney on 7/12/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull const kCustomUserDefaultsDidUpdate = @"com.michael.kCustomUserDefaultsDidUpdate";

@interface CustomUserDefaults : NSObject

+(nonnull instancetype)shared;

-(void)setObject:(nonnull id)object forKey:(nonnull NSString *)key;
-(void)objectForKey:(nonnull NSString *)key;

-(void)reset;

@end
