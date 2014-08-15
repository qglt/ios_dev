//
//  BaseMenuView.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-11.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  BaseMenuViewDelegate <NSObject>

- (void)hiddeRightMeun;

@end


@interface BaseMenuView : UIView

@property (nonatomic,strong)Class dataCell;

@property (nonatomic,weak)__weak id <BaseMenuViewDelegate>delegate;

- (void)refreshTableWithDictionary:(NSDictionary *)dict;

@end
