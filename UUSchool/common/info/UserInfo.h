//
//  UserInfo.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic,strong)NSString * name;
@property (nonatomic,strong)NSString * sex;
@property (nonatomic,strong)NSString * age;
@property (nonatomic,strong)NSString * school;
@property (nonatomic,strong)NSString * schoolArea;//校区
@property (nonatomic,strong)NSString * department; //专业
@property (nonatomic,strong)NSString * grade; //年级
@property (nonatomic,strong)NSString * E_mail;
@property (nonatomic,strong)NSString * tel;    //telphone
- (id)initWithDict:(NSDictionary *)dict;

- (NSDictionary *)dictionary;

@end
