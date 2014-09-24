//
//  TeachInfo.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-23.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "LifeBaseinfo.h"

@interface TeachInfo : LifeBaseinfo

@property (nonatomic,strong)NSString * price;
@property (nonatomic,strong)NSString * subject;//科目
@property (nonatomic,strong)NSString * grade;  //年级
@property (nonatomic,strong)NSString * location;
@property (nonatomic,strong)NSString * logitude;
@property (nonatomic,strong)NSString * latitude;
@property (nonatomic,strong)NSString * littleSex;
@property (nonatomic,strong)NSString * category;

@end
