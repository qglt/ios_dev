//
//  BaseContentView.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-6.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseContentView : UIView

@property (nonatomic,strong)Class dataCell;

@property (nonatomic,strong,setter = setlistData:)NSMutableArray * listData;

/**
 * @param : @{@"key" : @[value1,value2,...],@"key" : @[value1,value2,...]}
 */

@property (nonatomic,strong)NSMutableDictionary * rightMenuData;

- (id)initWithFrame:(CGRect)frame andRowHeight:(CGFloat)rowHeight;

- (void)showMenuButtonWithTitle:(NSString *)title;

- (void)setTableHeader:(UIView *)header;

- (void)refreshTableDataWith:(NSArray *)dataArray;

@end
