//
//  main.m
//  Copy
//
//  Created by Michael Babiy on 1/26/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:
                                    [NSMutableString stringWithString: @"one"],
                                    [NSMutableString stringWithString: @"two"],
                                    [NSMutableString stringWithString: @"three"], nil];

        NSMutableString *string;
        NSMutableArray *copy;

        NSLog (@"dataArray: ");
        
        for (NSString *elem in dataArray) {
            NSLog (@" %@", elem);
        }
        
        // Make a copy, then change one of the strings
        
        copy = [dataArray mutableCopy];
        string = dataArray[0];
        
        [string appendString: @"ONE"];
        
        NSLog (@"dataArray: ");
        
        for (NSString *elem in dataArray) {
            NSLog (@" %@", elem);
        }
        
        NSLog (@"dataArray2: ");
        
        for (NSString *elem in copy) {
            NSLog (@" %@", elem);
        }
    }
    
    return 0;
}
