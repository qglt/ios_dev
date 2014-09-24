//
//  HUD.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-22.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUD : UIView

+ (void)showMessage:(NSString *)message image:(NSString *)imageName title:(NSString *)title cancelButton:(NSString *)cancelTitle otherButtons:(NSString *)other,...;

@end
