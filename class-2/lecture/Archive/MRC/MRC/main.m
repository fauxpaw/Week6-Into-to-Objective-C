//
//  main.m
//  MRC
//
//  Created by Michael Babiy on 1/26/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *adam = [[Person alloc]init];
        
        [adam setName:@"Adam"];
        [adam setEmail:@"Adam@gmail.com"];
        
        
        NSLog(@"NAME: %@", adam.name);
        NSLog(@"EMAIL: %@", adam.email);
        
        NSLog(@"Description: %@",[adam description]);
        
//        [adam release];
        
    }
    return 0;
}
