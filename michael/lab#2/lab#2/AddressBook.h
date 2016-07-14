//
//  AddressBook.h
//  lab#2
//
//  Created by Michael Sweeney on 7/12/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface AddressBook : NSObject


{
    NSString *_owner;
    NSMutableArray *_book;
}
-(void)setOwner:(NSString *)owner;
-(NSString *)owner;
-(void)setBook:(NSString *)book;
-(NSMutableArray *)book;


-(instancetype) initWithName:(NSString *)name;
-(void) addPerson: (Person *) thePerson;
-(NSUInteger) count;
-(void) list;
-(Person *) search:(NSString*) name;

@end
