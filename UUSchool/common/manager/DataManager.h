//
//  DataManager.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-12.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfo;

@protocol DataManagerDelegate <NSObject>

- (void)requestFinish:(NSArray *)requestData;

- (void)requestFailler:(NSString *)errorMsg;

@end

@interface DataManager : NSObject

SINGLETON_DEFINE(DataManager);

@property (nonatomic,weak)__weak id <DataManagerDelegate>delegate;

#pragma mark - userInfo -
- (UserInfo *)getUserInfoFromNetworkByID:(NSString *)userID;
- (void)changeServerUserInfo:(UserInfo *)info callBack:(void(^)(BOOL ok))callBack;


- (UserInfo *)getUserInfoFromLocalByID:(NSString *)userID;

- (void)changeLocalUserInfo:(UserInfo *)info callBack:(void(^)(BOOL ok))callBack;

- (void)localizeUserInfo:(UserInfo *)info callBack:(void(^)(BOOL ok))callBack;

- (void)deleteLocalUser:(UserInfo *)info callBack:(void(^)(BOOL ok))callBack;

- (void)checkLocalUser:(UserInfo *)info callBack:(void(^)(BOOL ok))callBack;

#pragma mark - lifeController -
#warning 生活部分数据处理方法，还需要添加（删除，修改）等操作方法。

- (void)getLifeContentDataWithLifeType:(NSString *)lifeType category:(NSString *)category subCategory:(NSString *)subCategory pageCount:(int)pageCount;
- (void)uploadLifeDataToLifeType:(NSString *)keyString dataDict:(NSDictionary *)dict;


@end
