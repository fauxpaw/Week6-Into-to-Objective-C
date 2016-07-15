//
//  Student+Extension.h
//  lab#3
//
//  Created by Michael Sweeney on 7/13/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//
@import CloudKit;
#import "Student.h"
#import "NSString+Extension.h"


typedef void(^StudentCompletion)(NSArray<Student *> *students);

@interface Student (Extension)
+(void)studentsFromRecords:(NSArray<CKRecord *> *)records completion: (StudentCompletion)completion;
- (BOOL)isValid;


@end
