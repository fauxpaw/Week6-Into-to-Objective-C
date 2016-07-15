//
//  ViewController.m
//  lab#3
//
//  Created by Michael Sweeney on 7/13/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "ViewController.h"
#import "Store.h"
#import "Student.h"
#import "AddViewController.h"
#import "CloudService.h"

@interface ViewController ()<UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //code to test
    //[[CloudService shared]]
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:[AddViewController identifier]]) {
        AddViewController *addViewController = (AddViewController *)segue.destinationViewController;
        addViewController.completion = ^ {
            [self.tableView reloadData];
        };
    } //add completion somewhere
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[Store shared]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *studentCell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    Student *student = [[Store shared]studentForIndexPath:indexPath];
    studentCell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    studentCell.detailTextLabel.text = [NSString stringWithFormat:@"Phone: %@ Email: %@", student.phone, student.email];
    
    return studentCell;
}

-(void)updateStudents{
    __weak typeof (self) weakSelf = self;
    [[CloudService shared]enqueueOperation:^(BOOL success, NSArray<Student *> *students) {
        [[Store shared]addStudentsFromCloudKit:students];
        //TODO:
        [weakSelf.tableView reloadSections: [NSIndexSet indexSetWithIndex: 0] withRowAnimation:UITableViewRowAnimationRight];
    }];
}

#pragma mark - UITableViewDelegate

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[Store shared]removeStudentAtIndexPath:indexPath completion:^{
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        }];
        
    }
}


@end
