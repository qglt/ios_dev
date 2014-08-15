//
//  AccountInfo.h
//  TtcyMngl
//
//  Created by 青格勒图 on 14-6-27.
//  Copyright (c) 2014年 hqglt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

@interface AccountInfo : NSObject

@property (nonatomic,strong)NSString * nickName;
@property (nonatomic,strong)NSString * userID;
@property (nonatomic,strong)NSString * pwd;
@property (nonatomic,setter = setSave:)BOOL savePwd;
@property (nonatomic,strong)NSString * userIcon;
@property (nonatomic,strong)NSString * level;
@property (nonatomic,strong)NSString * longitude;
@property (nonatomic,strong)NSString * latitude;

@property (nonatomic,strong)UserInfo * userInfo;

- (id)initWithJsonString:(NSString *)json;

@end
