//
//  Employee.m
//  lab#1
//
//  Created by Michael Sweeney on 7/11/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "Employee.h"

@implementation Employee

-(void)getJobTitle:(Person *)input{
    if ([input.firstName  isEqual: @"Michael"]) {
        NSLog(@"iOS Dev");
    }
    else {
        NSLog(@"silly Android devs");
    }
}

@end
