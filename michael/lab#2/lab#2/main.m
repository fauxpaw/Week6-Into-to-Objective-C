//
//  main.m
//  lab#2
//
//  Created by Michael Sweeney on 7/12/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "AddressBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *johnny = [[Person alloc] init];
        [johnny setName:@"Johnny"];
        [johnny setEmail:@"Johnny@gmail.com"];
        [johnny setAddress:@"1234 56th NW Seattle"];
        
        Person *sarah = [[Person alloc] init];
        [sarah setName:@"Sarah"];
        [sarah setEmail:@"valhalla@google.com"];
        [sarah setAddress:@"10324 23rd Ave NE Seattle"];
        
        Person *gemma = [[Person alloc] init];
        [gemma setName:(@"Gemma")];
        [gemma setAddress:@"555 Front St Ballard"];
        [gemma setEmail:@"random@netscape.com"];
       
        
        //NSLog(@"Description: %@", [johnny description]);
        
        AddressBook *myBook = [[AddressBook alloc] initWithName:@"Michael's Book"];
        [myBook addPerson:johnny];
        [myBook addPerson:gemma];
        [myBook addPerson:sarah];
        [myBook list];
        [myBook count];
        
    
        
        
        [johnny release];
        [myBook release];
        [sarah release];
        [gemma release];
        
        
        
    
    }
    return 0;
}
