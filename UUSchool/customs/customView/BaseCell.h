//
//  BaseCell.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeBaseinfo.h"
#import "UIImageView+WebCache.h"

typedef enum
{
    BaseCellTypeDefult = 15 + 14 + 6,                        //图，标题，介绍
    BaseCellTypeImageAndTitle = 15 + 14,                     //图，标题
    BaseCellTypeDetailAndTitle = 14 + 6,                    //标题，介绍
    BaseCellTypeOtherAndTitle = 14 + 2,                     //标题 ＋ 左菜单
    BaseCellTypeOtherDetailAndTitle = 2 + 14 +6,               //左菜单 ＋ 标题 ＋ 介绍
    BaseCellTypeOtherImageAndTitle = 2+15+14,                //左菜单 ＋ 图 ＋ 标题
    BaseCellTypeOtherDetailImageAndTitle = 2+15+14+6           //左菜单 ＋ 图 ＋ 标题 ＋ 介绍
}BaseCellType;


@interface BaseCell : UITableViewCell
{
    CGFloat * detailHeight;
    
}
@property (nonatomic,strong,setter = setBorderColor:)UIColor * borderColor;

@property (nonatomic,strong)UIImageView * image_H;

@property (nonatomic,strong)UILabel * titleText;

@property (nonatomic,strong)UILabel * detailText;

@property (nonatomic,strong)UIView * otherView;

- (void)setCellType:(BaseCellType)type;

- (void)setUpCellWithData:(id)data;

@end
