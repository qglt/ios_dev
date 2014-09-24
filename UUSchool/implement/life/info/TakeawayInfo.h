//
//  TakeawayInfo.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-22.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "LifeBaseinfo.h"

@interface TakeawayInfo : LifeBaseinfo

@property (nonatomic,strong)NSString * price;    //价格
@property (nonatomic,strong)NSString * sales;    //售量
@property (nonatomic,strong)NSString * category; //分类
@property (nonatomic,strong)NSString * subCategory; //子分类
@property (nonatomic,strong)NSString * commentary;  //评论
@property (nonatomic,strong)NSString * good;    //赞👍

@end
