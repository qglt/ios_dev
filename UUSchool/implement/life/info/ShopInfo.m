//
//  ShopInfo.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-25.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "ShopInfo.h"
#import "JSONKit.h"

@implementation ShopInfo
- (id)initWithJson:(NSString *)jsonString
{
    self = [super init];
    if (self) {
        NSDictionary * dict = [jsonString objectFromJSONString];
        [self initFromDictionary:dict];
    }
    return self;
}
- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self initFromDictionary:dict];
    }
    return self;
}
- (void)initFromDictionary:(NSDictionary *)dict
{
    self.price = dict[@"price"];
    self.originPrice = dict[@"originPrice"];
    self.category = dict[@"category"];
    self.subCategory = dict[@"subCategory"];
    self.store = dict[@"store"];
    self.logitude = dict[@"logitude"];
    self.latitude = dict[@"latitude"];
    self.sales = dict[@"sales"];
    self.surplus = dict[@"surplus"];
    self.commentary = dict[@"commentary"];
    self.city = dict[@"city"];
    self.area = dict[@"area"];
    self.tel = dict[@"tel"];
    
    self.imageUrl = dict[@"imageUrl"];
    self.title = dict[@"title"];
    self.detail = dict[@"detail"];
    self.userID = dict[@"userID"];
}
-(id)init
{
    self = [super init];
    if (self) {
        self.price = @"";
        self.originPrice = @"";
        self.category = @"";
        self.subCategory = @"";
        self.store = @"";
        self.logitude = @"";
        self.latitude = @"";
        self.sales = @"";
        self.surplus = @"";
        self.commentary = @"";
        self.city = @"";
        self.area = @"";
        self.tel = @"";
        
        self.imageUrl = @"";
        self.title = @"";
        self.detail = @"";
        self.userID = @"";
    }
    return self;
}
- (NSDictionary *)dictionary
{
    return @{
             @"price" :self.price,
             @"originPrice" : self.originPrice,
             @"category" : self.category,
             @"subCategory" :self.subCategory,
             @"store" : self.store,
             @"logitude" : self.logitude,
             @"latitude" : self.latitude,
             @"sales" :self.sales,
             @"surplus" : self.surplus,
             @"commentary" : self.commentary,
             @"city" : self.city,
             @"area" : self.area,
             @"tel" : self.tel,
             @"imageUrl" : self.imageUrl,
             @"title" : self.title,
             @"detail" : self.detail,
             @"userID" : self.userID
             };
}
@end
