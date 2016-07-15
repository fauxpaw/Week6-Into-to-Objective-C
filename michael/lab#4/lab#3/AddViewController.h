//
//  AddViewController.h
//  lab#3
//
//  Created by Michael Sweeney on 7/14/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddViewControllerCompletion)();


@interface AddViewController : UIViewController

@property (copy, nonatomic) AddViewControllerCompletion completion;

+ (NSString *)identifier;


@end
