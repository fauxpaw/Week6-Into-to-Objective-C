//
//  Person.h
//  lab#1
//
//  Created by Michael Sweeney on 7/11/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Go4Go.h"

@interface Person : NSObject <Go4Go>


@property NSString *firstName;
@property NSString *lastName;
-(instancetype)initWithAge:(int)age;

-(void)greeting;

@end
