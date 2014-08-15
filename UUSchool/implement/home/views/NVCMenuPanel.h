//
//  NVCMenuPanel.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-5.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"



@interface NVCMenuPanel : UIView

@property (nonatomic, copy) void (^itemClick)(MenuItem *item);

@property (nonatomic,strong,setter = setMenuItems:)NSMutableArray * menuItems;

- (void)showPanel:(BOOL)show;

@end
