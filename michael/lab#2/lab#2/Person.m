//
//  Person.m
//  lab#2
//
//  Created by Michael Sweeney on 7/12/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark - getters/setters


-(void)setName:(NSString *)name{
    
    if(_name != name){
        [name retain];
        [_name release];
        
        _name = name;
    }
    
}
-(NSString *)name{
    
    return _name;
}

-(void)setEmail:(NSString *)email{
    [email retain];
    [_email release];
    
    _email = email;
}
-(NSString *)email{
    return _email;
}

-(void)setAddress:(NSString *)address{
    [address retain];
    [_address release];
    
    _address = address;
}
-(NSString *)address{
    return _address;
}

-(NSString *)description{
    
    NSString *description = [[[NSString alloc] initWithFormat:@"Name: %@, Email: %@, Address: %@", self.name, self.email, self.address]autorelease];
    return description;

}

-(void)dealloc{
    [_name release];
    [_email release];
    [_address release];
    [super dealloc];
}
@end
