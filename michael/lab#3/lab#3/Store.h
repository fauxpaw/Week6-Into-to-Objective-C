//
//  Store.h
//  lab#3
//
//  Created by Michael Sweeney on 7/13/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

@import UIKit;
@class Student;


@interface Store : NSObject


+ (instancetype)shared;

-(NSArray *)allStudents;
-(Student *)studentForIndexPath:(NSIndexPath *)indexPath;
-(NSInteger)count;

-(void)addStudent:(Student *)student;
-(void)removeStudent:(Student *)student;
-(void)removeStudentAtIndexPath:(NSIndexPath *)indexPath;
-(void)save;


@end
