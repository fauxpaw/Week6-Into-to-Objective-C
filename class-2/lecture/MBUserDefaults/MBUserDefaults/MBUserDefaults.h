//
//  MBUserDefaults.h
//  MBUserDefaults
//
//  Created by Michael Babiy on 1/25/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull const kMBUserDefaultsDidUpdate = @"com.michaelbabiy.kMBUserDefaultsDidUpdate";

@interface MBUserDefaults : NSObject

+ (nonnull instancetype)sharedDefaults;

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key;
- (nullable id)objectForKey:(nonnull NSString *)key;

- (void)reset;

@end
