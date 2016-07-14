//
//  PreferencesViewController.m
//  MBUserDefaults
//
//  Created by Michael Babiy on 1/26/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import "PreferencesViewController.h"
#import "MBUserDefaults.h"

@interface PreferencesViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *preferencesSwitch;

- (IBAction)closeButtonSelected:(UIButton *)sender;
- (IBAction)preferencesChanged:(UISwitch *)sender;

@end

@implementation PreferencesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupPreferencesViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setupPreferencesViewController
{
    [self.preferencesSwitch setOn:[[[MBUserDefaults sharedDefaults]objectForKey:@"com.michaelbabiy.kUserPreferences"]boolValue]];
}

- (IBAction)closeButtonSelected:(UIButton *)sender
{
    if (self.completion) {
        self.completion();
    }
}

- (IBAction)preferencesChanged:(UISwitch *)sender
{
    [[MBUserDefaults sharedDefaults]setObject:@(sender.isOn) forKey:@"com.michaelbabiy.kUserPreferences"];
}

@end
