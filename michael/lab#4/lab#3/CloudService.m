//
//  CloudService.m
//  lab#3
//
//  Created by Michael Sweeney on 7/14/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "CloudService.h"
#import "Student+Extension.h"

static NSString *const StudentRecordType = @"Student";

@interface CloudService ()

@property (strong, nonatomic) CKContainer *container;
@property (strong, nonatomic) CKDatabase *database;


@end

@implementation CloudService

+ (instancetype)shared{
    
    static CloudService *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    return shared;
}

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        _container = [CKContainer defaultContainer];
        _database = [_container privateCloudDatabase];
    }
    return self;
}

-(void)enqueueOperation:(CloudServiceCompletion)completion{
    [self retrieve:completion];
}

-(void)enqueueOperation:(CloudOperation)operation student: (Student *)student completion:(CloudServiceCompletion)completion{
    if (operation == CloudOperationSave) {
        [self save:student completion:completion];
    }
    
    if (operation == CloudOperationRetrieve) {
        [self retrieve:completion];
    }
    
    if (operation == CloudOperationDelete) {
        [self delete:student completion:completion];
    }
}

#pragma mark - helper methods

-(void)retrieve:(CloudServiceCompletion)completion{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    CKQuery *query = [[CKQuery alloc]initWithRecordType:StudentRecordType predicate:predicate];
    [self.database performQuery:query inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
    [Student studentFromRecords: results completion: ^(NSArray<Student*> *students)];
    }];
    
}
-(void)save:(Student *)student completion: (CloudServiceCompletion)completion{
    
    CKRecord *record = [[CKRecord alloc] initWithRecordType:StudentRecordType];
    record[@"first"] = student.firstName;
    //complete for other fields
    
    [self.database saveRecord:record completionHandler:^(CKRecord * _Nullable record, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error saving to cloudkit. Error %@", [error localizedDescription]);
        }
        
        if (!error && record) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(YES, @[student]);
            });
        }
    }];
  
}

-(void)delete:(Student *)student completion: (CloudServiceCompletion)completion{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email == %@", student.email];
    CKQuery *query = [[CKQuery alloc]initWithRecordType:StudentRecordType predicate:predicate];
    
    [self.database performQuery:query inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
        
        if (results && !error) {
            
            for (CKRecord  *record in results) {
                [self.database deleteRecordWithID:record.recordID completionHandler:^(CKRecordID * _Nullable recordID, NSError * _Nullable error) {
                    if (error) {
                        NSLog(@"Error deleting student record. Error %@", [error localizedDescription]);
                    }
                    else {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            completion(YES, @[student]);
                        }];
                    }
                }];
            }
            
        }
        
    }];
}


@end
