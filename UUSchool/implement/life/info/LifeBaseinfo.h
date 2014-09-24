//
//  LifeBaseinfo.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-22.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LifeBaseinfo : NSObject

@property (nonatomic,strong)NSString * imageUrl;
@property (nonatomic,strong)NSString * title;
@property (nonatomic,strong)NSString * detail;
@property (nonatomic,strong)NSString * userID;

- (id)initWithJson:(NSString *)jsonString;
- (id)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionary;

@end
