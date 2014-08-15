//
//  DBManger_Define.h
//  TtcyMngl
//
//  Created by Lucky_Truda on 14-6-24.
//  Copyright (c) 2014年 hqglt. All rights reserved.
//

#ifndef TtcyMngl_DBManger_Define_h
#define TtcyMngl_DBManger_Define_h

#define CREATE_USERINFO_TABLE @"CREATE TABLE IF NOT EXISTS %@(phone TEXT(100) , pass TEXT(100) , userIcon TEXT(100) , savePasswd TEXT(100))"

#define TABLE_USERINFO @"userInfo"

#define INSERT_USERINFO @"INSERT INTO %@(phone, pass, userIcon, savePasswd) VALUES(?,?,?,?)"

#define USER_PARAMETER userObj.phone, userObj.pass, userObj.userIcon, [NSString stringWithFormat:@"%d",userObj.savePasswd]

#endif
