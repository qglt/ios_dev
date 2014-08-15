//
//  DataManager.h
//  UUSchool
//
//  Created by 青格勒图 on 14-8-12.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfo;

@interface DataManager : NSObject

SINGLETON_DEFINE(DataManager);

#pragma mark - userInfo -
- (UserInfo *)getUserInfoFromNetworkByID:(NSString *)userID;
- (void)changeServerUserInfo:(UserInfo *)info callBack:(void(^)(BOOL ok))callBack;


- (UserInfo *)getUserInfoFromLocalByID:(NSString *)userID;

- (void)changeLocalUserInfo:(UserInfo *)info callBack:(void(^)(BOOL ok))callBack;

- (void)localizeUserInfo:(UserInfo *)info callBack:(void(^)(BOOL ok))callBack;

- (void)deleteLocalUser:(UserInfo *)info callBack:(void(^)(BOOL ok))callBack;

- (void)checkLocalUser:(UserInfo *)info callBack:(void(^)(BOOL ok))callBack;

#pragma mark - lifeController -
- (NSArray *)getTakeawayDataForKey:(NSString *)keyString category:(NSString *)category pageCount:(int)pageCount;
- (NSArray *)getWorkDataForKey:(NSString *)keyString pageCount:(int)pageCount;
- (NSArray *)getTeachDataForKey:(NSString *)keyString pageCount:(int)pageCount;
- (NSArray *)getShopDataForKey:(NSString *)keyString pageCount:(int)pageCount;
- (NSArray *)getGroupenDataForKey:(NSString *)keyString pageCount:(int)pageCount;

@end
