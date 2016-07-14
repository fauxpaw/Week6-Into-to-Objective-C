//
//  Person.m
//  lab#1
//
//  Created by Michael Sweeney on 7/11/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)findPokemon{
    
    NSLog(@"A wild Mewtwo has appeared!");
    
}

-(void)goForWalk{
    NSLog(@"You start walking...");

}

-(void)greeting{
    NSLog(@"Hello, my name is %@, how are you?", [self firstName]);
}

-(instancetype)initWithAge:(int)age {
    
    self = [super init];
    return self;
}



@end
