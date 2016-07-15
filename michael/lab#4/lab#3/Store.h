//
//  Store.h
//  lab#3
//
//  Created by Michael Sweeney on 7/13/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

@import UIKit;
@class Student;

typedef void(^StoreCompletion)();

@interface Store : NSObject


+ (instancetype)shared;

-(void)addStudentsFromCloudKit:(NSArray *)students;
-(NSArray *)allStudents;
-(Student *)studentForIndexPath:(NSIndexPath *)indexPath;
-(NSInteger)count;

-(void)addStudent:(Student *)student completion:(StoreCompletion)completion;
-(void)removeStudent:(Student *)student completion:(StoreCompletion)completion;
-(void)removeStudentAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion;
-(void)save;


@end
