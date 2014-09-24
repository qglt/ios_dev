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

@property (nonatomic,strong)UITableView * dataTable;

@property (nonatomic,strong,setter = setlistData:)NSMutableArray * listData;

@property (nonatomic,strong)NSMutableArray * rowHeights;
/**
 * @param : @{@"key" : @[value1,value2,...],@"key" : @[value1,value2,...]}
 */

@property (nonatomic,strong)NSMutableDictionary * rightMenuData;

- (void)showMenuButtonWithTitle:(NSString *)title;

- (void)setTableHeader:(UIView *)header;

- (void)refreshTableDataWith:(NSArray *)dataArray;

/**
 * @method  外界不可调用，只可以子类调用
 */
- (void)didSelectCellWithIndexPath:(NSIndexPath *)indexPath;

@end
