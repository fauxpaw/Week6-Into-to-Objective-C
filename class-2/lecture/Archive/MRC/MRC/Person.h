//
//  Person.h
//  MRC
//
//  Created by Adam Wallraff on 7/12/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    NSString *_name;
    NSString *_email;
}

-(void)setName:(NSString *)name;
-(NSString *)name;

-(void)setEmail:(NSString *)email;
-(NSString *)email;

-(NSString *)description;

@end
