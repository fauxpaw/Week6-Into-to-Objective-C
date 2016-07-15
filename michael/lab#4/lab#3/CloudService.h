//
//  CloudService.h
//  lab#3
//
//  Created by Michael Sweeney on 7/14/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

@import Foundation;
@import CloudKit;
@class Student;


//what is typedef
typedef enum : NSUInteger {
    
    CloudOperationSave = 0,
    CloudOperationRetrieve,
    CloudOperationDelete,
    
    //name of enum
}CloudOperation;

typedef void(^CloudServiceCompletion)(BOOL success, NSArray<Student *> *students);

@interface CloudService : NSObject

+ (instancetype)shared;

-(void)enqueueOperation:(CloudServiceCompletion)completion;
-(void)enqueueOperation:(CloudOperation)operation student: (Student *)student completion:(CloudServiceCompletion)completion;





@end
