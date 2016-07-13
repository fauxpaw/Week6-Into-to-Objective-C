//
//  ViewController.m
//  MBUserDefaults
//
//  Created by Michael Babiy on 1/25/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import "ViewController.h"
#import "MBUserDefaults.h"
#import "PreferencesViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

- (void)updateStatusLabel:(NSNotification *)notification;
- (IBAction)preferencesButtonSelected:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(updateStatusLabel:)
                                                name:kMBUserDefaultsDidUpdate object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PreferencesViewController"]) {
        PreferencesViewController *preferencesViewController = (PreferencesViewController *)segue.destinationViewController;
        preferencesViewController.completion = ^ {
            [self dismissViewControllerAnimated:YES completion:nil];
        };
    }
}

- (void)updateStatusLabel:(NSNotification *)notification
{
    self.statusLabel.text = [NSString stringWithFormat:@"Status: %@", [[[MBUserDefaults sharedDefaults]objectForKey:@"com.michaelbabiy.kUserPreferences"]boolValue] ? @"On" : @"Off"];
}

- (IBAction)preferencesButtonSelected:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"PreferencesViewController" sender:nil];
}

@end
