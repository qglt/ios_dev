//
//  AccountInfo.m
//  TtcyMngl
//
//  Created by 青格勒图 on 14-6-27.
//  Copyright (c) 2014年 hqglt. All rights reserved.
//

#import "AccountInfo.h"
#import <JSONKit.h>
#import <CommonCrypto/CommonCrypto.h>
@implementation AccountInfo

-(id)initWithJsonString:(NSString *)json
{
    if (self = [super init]) {
        NSDictionary * dict = [json objectFromJSONString];
        
        self.userID = [dict objectForKey:@"userID"];
        self.pwd = [dict objectForKey:@"pwd"];
        self.savePwd = [[dict objectForKey:@"savePwd"] boolValue];
        self.nickName = [dict objectForKey:@"nickName"];
        self.level = [dict objectForKey:@"level"];
        self.userInfo = [[UserInfo alloc]initWithDict:[dict objectForKey:@"userInfoDict"]];
        self.longitude = [dict objectForKey:@"longitude"];
        self.latitude = [dict objectForKey:@"latitude"];

#warning - 默认用户头像
        self.userIcon = @"moren_bg";
        if ([dict objectForKey:@"icon"]) {
            self.userIcon = [dict objectForKey:@"userIcon"];
        }
    }
    return  self;
}
-(id)init
{
    if (self = [super init]) {
#warning - 默认用户头像
        self.userIcon = @"moren_bg";
        
    }
    return  self;
}

-(void)setSave:(BOOL)savePwd
{
    _savePwd = savePwd;
    
}

@end


