//
//  WorkInfo.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-23.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "LifeBaseinfo.h"

@interface WorkInfo : LifeBaseinfo

@property (nonatomic,strong)NSString *price;

@property (nonatomic,strong)NSString * institution; //机构

@property (nonatomic,strong)NSString * category;    //工作类型（服务类。。。。。。？）

@property (nonatomic,strong)NSString * location;    //执行地点

@property (nonatomic,strong)NSString * logitude;

@property (nonatomic,strong)NSString * latitude;

@property (nonatomic,strong)NSString * when;        //时间


@end
