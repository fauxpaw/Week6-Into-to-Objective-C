//
//  Store.m
//  lab#3
//
//  Created by Michael Sweeney on 7/13/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "Store.h"
#import "Student.h"
#import "NSString+Extension.h"
#import "CloudService.h"


@interface Store ()

@property (copy, nonatomic) NSMutableArray *students;

@end

@implementation Store


+ (instancetype)shared{
    
    static Store *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    return shared;
}
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _students = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:[NSString archivePath]]];
        
        if (!_students) {
            _students = [[NSMutableArray alloc]init];
        }
    }
    
    return self;
}

-(void)addStudentsFromCloudKit:(NSArray *)students{
    if (students.count == 0) {
        self.students = [[NSMutableArray alloc]initWithArray:students];
    }
    
    else {
        for (Student *student in students) {
            
            NSString *email = student.email;
            BOOL found = NO;
            for (Student *localStudent in self.students) {
                if ([email compare:localStudent.email == NSOrderedSame]) {
                    found = YES;
                    break;
                }
                
                if (!found) {
                    [self.students addObject:student];
                }
            }
            
        }
    }
}


-(NSArray *)allStudents {
    return self.students;
}
-(Student *)studentForIndexPath:(NSIndexPath *)indexPath{
    return self.students[indexPath.row];
}
-(NSInteger)count{
    return self.students.count;
}

-(void)addStudent:(Student *)student completion:(StoreCompletion)completion{
    if (![self.students containsObject:student]) {
     [[CloudService shared]enqueueOperation:^(BOOL success, NSArray<Student *> *students) {
         if (success) {
             [self.students addObject:student];
             [self save];
             
             completion();
         }
     }];
    }
        
}
-(void)removeStudent:(Student *)student completion:(StoreCompletion)completion{
    if ([self.students containsObject:student]) {
        [[CloudService shared]enqueueOperation:CloudOperationDelete student:student completion:^(BOOL success, NSArray<Student *> *students) {
            [self.students removeObject:student];
            [self save];
        }];
    }
}
-(void)removeStudentAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion{
    [self removeStudent:[self studentForIndexPath:indexPath] completion:completion];
}
-(void)save{
    [NSKeyedArchiver archiveRootObject:self.students toFile:[NSString archivePath]];
}



@end
