//
//  AddViewController.m
//  lab#3
//
//  Created by Michael Sweeney on 7/14/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "AddViewController.h"
#import "Student+Extension.h"
#import "Store.h"

@interface AddViewController ()

@property (strong, nonatomic) Student *student;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;

@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;


- (IBAction)saveButtonSelected:(UIButton *)sender;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", [[Store shared]allStudents]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+ (NSString *)identifier{
    return NSStringFromClass(self);
}

-(Student *)student {
    if (!_student) {
        _student = [[Student alloc] init];
    }
    return _student;
}


- (IBAction)saveButtonSelected:(UIButton *)sender {
    
    NSLog(@"Save pressed!!");
    
    self.student.firstName = self.firstNameField.text;
    self.student.lastName = self.lastNameField.text;
    self.student.email = self.emailField.text;
    self.student.phone = self.phoneField.text;
    
    
    if (self.student.isValid && self.completion) {
        [[Store shared]addStudent:self.student];
        [self completion]();
        [self.navigationController popViewControllerAnimated:YES];
    }
    NSLog(@" %@", [Store shared]);
}


@end
