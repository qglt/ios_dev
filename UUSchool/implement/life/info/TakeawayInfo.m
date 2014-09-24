//
//  TakeawayInfo.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-22.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "TakeawayInfo.h"
#import "JSONKit.h"

@implementation TakeawayInfo

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
    self.sales = dict[@"sales"];
    self.category = dict[@"category"];
    self.subCategory = dict[@"subCategory"];
    self.commentary = dict[@"commentary"];
    self.good = dict[@"good"];
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
        self.sales = @"";
        self.category = @"";
        self.subCategory = @"";
        self.commentary = @"";
        self.good = @"";
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
                @"price": self.price,
                @"sales":self.sales,
                @"category":self.category,
                @"subCategory":self.subCategory,
                @"commentary":self.commentary,
                @"good":self.good,
                @"imageUrl":self.imageUrl,
                @"title":self.title,
                @"detail":self.detail,
                @"userID":self.userID
            };
}

@end
