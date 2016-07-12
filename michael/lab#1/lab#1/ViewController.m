//
//  ViewController.m
//  lab#1
//
//  Created by Michael Sweeney on 7/11/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "ViewController.h"
#import "NSString+arrayOfWords.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *myString = @"this is the worst language ever";
    NSNumber *myNumber = @16;
    NSArray *myArray = @[@"first", @"second", @"third"];
    
    //TESTING STUFF
    //    NSLog(@"%@", myString);
    //    NSArray *myArray = [myString componentsSeparatedByString:@" "];
    //    NSLog(@"%@", myArray);
    
    //PROBLEM #1
    [myString convertToArray:myString];
    
    //PROBLEM #2
    [self variableOutput:myNumber];
    [self variableOutput:myString];
    [self variableOutput:myArray];
    
    //PROBLEM #4
    Person *person1 = [[Person alloc] initWithAge:32];
    [person1 setFirstName:@"Michael"];
    [person1 setLastName:@"Sweeney"];
    [person1 greeting];
    [person1 goForWalk];
    [person1 findPokemon];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    //PROBLEM #2
-(void)variableOutput:(id)input {
    
    if ([input isKindOfClass:[NSString class]]) {
        NSLog(@"you passed a STRING");
        NSMutableString *reversed = [NSMutableString string];
        NSInteger charIndex = [input length];
        while (charIndex > 0) {
            charIndex -= 1;
            NSRange subStringRange = NSMakeRange(charIndex, 1);
            [reversed appendString:[input substringWithRange:subStringRange]];
        }
        NSLog(@"%@", reversed);
    }
    
    else if ([input isKindOfClass:[NSArray class]]) {
        NSLog(@"you passed a ARRAY");
        
        int stringCounter = 0;
        int arrayCounter = 0;
        int objectCounter = 0;
        int numCounter = 0;
        
        for (id element in input) {
            if ([element isKindOfClass: [NSString class]]){
                NSLog(@"value is equal to STRING");
                stringCounter++;
            }
            else if ([element isKindOfClass:[NSArray class]]){
                NSLog(@"value is equal to ARRAY");
                arrayCounter++;
            }
            else if ([element isKindOfClass:[NSNumber class]]){
                NSLog(@"value is equal to NUMBER");
                numCounter++;
            }
            else {
                NSLog(@"not identified, defaulting to object");
                objectCounter++;
            }
        }
        
        NSLog(@"Your array contains %i strings, %i arrays, %i numbers, %i objects.", stringCounter, arrayCounter, numCounter, objectCounter);
    }
    
    else if ([input isKindOfClass:[NSNumber class]]) {
        NSLog(@"you passed a NUMBER");
        
        NSLog(@"Square Root = %f", sqrtf([input floatValue]));
        
    }
    
    else {
        NSLog(@"what the hell is it...");
    }
    
}

@end
