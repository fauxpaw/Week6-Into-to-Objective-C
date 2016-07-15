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

-(void)showAlertView{
    NSString *title = @"Error...";
    NSString *message = @"please fill out all required information";
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    
    [controller addAction:okAction];
    // present actionsheet
}

- (IBAction)saveButtonSelected:(UIButton *)sender {
    
    self.student.firstName = self.firstNameField.text;
    self.student.lastName = self.lastNameField.text;
    self.student.email = self.emailField.text;
    self.student.phone = self.phoneField.text;
    
    
    if (self.student.isValid && self.completion) {
        //check this
        [[Store shared]addStudent:[self student] completion:^{
            //
        }];
        [self completion]();
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self showAlertView];
    }
}


@end
