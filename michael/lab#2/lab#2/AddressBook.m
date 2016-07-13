//
//  AddressBook.m
//  lab#2
//
//  Created by Michael Sweeney on 7/12/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook


-(Person *) search:(NSString*) name{
    
    for (Person *nextPerson in _book) {
        if ([nextPerson.name caseInsensitiveCompare:name] == NSOrderedSame){
            return nextPerson;
        }
    }
    return nil;
}

-(void)setOwner:(NSString *)owner{
    if (_owner != owner) {
        [owner retain];
        [_owner release];
        
        _owner = owner;
    }
}
-(NSString *)owner{
    
    return _owner;
    
}


-(NSMutableArray *)book{
    
    return _book;
}



-(instancetype) initWithName:(NSString *)name {
    
    self = [super init];
    
    if (self) {
        
        _book = [NSMutableArray array];
    }
    
    return self;
}
-(void) addPerson: (Person *) thePerson{
    
    [_book addObject: thePerson];   
    
}
-(NSUInteger) count{
    NSLog(@"%lu", (unsigned long)[_book count]);
    return [_book count];
}
-(void) list{
    for (Person *thePerson in _book) {
        NSLog(@"%@, %@, %@", thePerson.name, thePerson.email, thePerson.address);
    }
}

@end
