//
//  NSString+arrayOfWords.m
//  lab#1
//
//  Created by Michael Sweeney on 7/11/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "NSString+arrayOfWords.h"

@implementation NSString (arrayOfWords)

-(NSArray *)convertToArray:(NSString *)input {
    NSArray *myArray = [input componentsSeparatedByString:@" "];
    NSLog(@"%@", myArray);
    return myArray;
}

    
@end
