//
//  Student.h
//  lab#3
//
//  Created by Michael Sweeney on 7/13/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;


@interface Student : NSObject


{
    NSString *_firstName;
    NSString *_lastName;
    NSString *_email;
    NSString *_phone;
}

-(instancetype) initWithFirstName:(NSString *) firstName
                         lastName:(NSString *) lastName
                            email:(NSString *) email
                            phone:(NSString *) phone;

-(void) setFirstName:(NSString *)firstName;
-(NSString *)firstName;
-(void) setLastName:(NSString *)lastName;
-(NSString *)lastName;
-(void) setEmail:(NSString *)email;
-(NSString *)email;
-(void) setPhone:(NSString *)phone;
-(NSString *)phone;








@end
