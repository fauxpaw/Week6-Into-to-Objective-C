//
//  PreferencesViewController.h
//  MBUserDefaults
//
//  Created by Michael Babiy on 1/26/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PreferencesViewControllerCompletion)();

@interface PreferencesViewController : UIViewController

@property (copy, nonatomic) PreferencesViewControllerCompletion completion;

@end
