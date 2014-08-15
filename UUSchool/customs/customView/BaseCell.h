//
//  BaseCell.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    BaseCellTypeDefult = 0,                        //图，标题，介绍
    BaseCellTypeImageAndTitle,                     //图，标题
    BaseCellTypeDetailAndTitle,                    //标题，介绍
    BaseCellTypeOtherAndTitle,                     //标题 ＋ 左菜单
    BaseCellTypeOtherDetailAndTitle,               //左菜单 ＋ 标题 ＋ 介绍
    BaseCellTypeOtherImageAndTitle,                //左菜单 ＋ 图 ＋ 标题
    BaseCellTypeOtherDetailImageAndTitle           //左菜单 ＋ 图 ＋ 标题 ＋ 介绍
}BaseCellType;


@interface BaseCell : UITableViewCell

- (void)setCellType:(BaseCellType)type;

- (void)setUpCellWithData:(NSData *)data;

@end
