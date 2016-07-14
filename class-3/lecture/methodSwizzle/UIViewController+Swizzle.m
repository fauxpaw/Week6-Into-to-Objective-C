//
//  UIViewController+Swizzle.m
//  methodSwizzle
//
//  Created by Adam Wallraff on 7/13/16.
//  Copyright © 2016 Adam Wallraff. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzle)


+(void)load{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(swizzle_viewWillAppear:);
        
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

        
        BOOL didAddMethod = class_addMethod(class, swizzledSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            
        }
        else
        {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    });
    
}



-(void)swizzle_viewWillAppear:(BOOL)animated{
    [self swizzle_viewWillAppear:animated];
    
    
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2);
    
    UIView *topView = [[UIView alloc]initWithFrame:frame];
    topView.backgroundColor = [UIColor blackColor];
    
    NSLog(@"You got swizzled!");
    
    [self.view addSubview:topView];
    
}

@end
