//
//  Student+Extension.m
//  lab#3
//
//  Created by Michael Sweeney on 7/13/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "Student+Extension.h"

@implementation Student (Extension)

- (BOOL)isValid {
    if (self.firstName.length > 0 && self.lastName.length > 0 && self.email.isValidEmail) {
        return YES;
    }
    
    else {
        return NO;
    }
}


@end
