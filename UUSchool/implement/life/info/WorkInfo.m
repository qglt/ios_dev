//
//  WorkInfo.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-23.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "WorkInfo.h"
#import "JSONKit.h"

@implementation WorkInfo

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
    self.institution = dict[@"institution"];
    self.category = dict[@"category"];
    self.location = dict[@"location"];
    self.logitude = dict[@"logitude"];
    self.latitude = dict[@"latitude"];
    self.when = dict[@"when"];
    
    
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
        self.institution = @"";
        self.category = @"";
        self.location = @"";
        self.logitude = @"";
        self.latitude = @"";
        self.when = @"";
        
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
             @"institution":self.institution,
             @"category":self.category,
             @"location":self.location,
             @"logitude":self.logitude,
             @"latitude":self.latitude,
             @"when":self.when,
             
             @"imageUrl":self.imageUrl,
             @"title":self.title,
             @"detail":self.detail,
             @"userID":self.userID
             };
}

@end
