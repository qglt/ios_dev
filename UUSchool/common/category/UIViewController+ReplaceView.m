//
//  UIViewController+ReplaceView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "UIViewController+ReplaceView.h"

@implementation UIViewController (ReplaceView)

- (void)replaceDisplayViewWithView:(UIView *)view
{
    for (UIView * obj in self.view.subviews) {
        if (![obj isKindOfClass:NSClassFromString(@"NVCMenuPanel")]) {
            [obj removeFromSuperview];
        }
    }
    view.frame = self.view.bounds;
    [self.view insertSubview:view atIndex:0];
    [self viewDidAppear:YES];
}

@end
