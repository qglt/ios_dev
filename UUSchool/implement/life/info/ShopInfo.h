//
//  ShopInfo.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-25.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "LifeBaseinfo.h"

@interface ShopInfo : LifeBaseinfo

@property (nonatomic,strong)NSString * price;
@property (nonatomic,strong)NSString * originPrice;  // yuan jia
@property (nonatomic,strong)NSString * category;
@property (nonatomic,strong)NSString * subCategory;
@property (nonatomic,strong)NSString * store;
@property (nonatomic,strong)NSString * logitude;
@property (nonatomic,strong)NSString * latitude;
@property (nonatomic,strong)NSString * sales;       //售量
@property (nonatomic,strong)NSString * surplus;     //余数
@property (nonatomic,strong)NSString * commentary;  //评论
@property (nonatomic,strong)NSString * city;
@property (nonatomic,strong)NSString * area;        //zhen dui fan wei
@property (nonatomic,strong)NSString * tel;         //tel

@end
