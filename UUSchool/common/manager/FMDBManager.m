//
//  FMDBManager.m
//  TtcyMngl
//
//  Created by 牛利江 on 14-6-13.
//  Copyright (c) 2014年 hqglt. All rights reserved.
//

#import "FMDBManager.h"


@implementation FMDBManager

SINGLETON_IMPLEMENT(FMDBManager);

- (id)init
{
    if (self = [super init])
    {
        [self createDB];
        [self createTable];
    }
    return self;
}
#pragma mark - self busyness 自己的方法

//创建数据库
- (void)createDB
{
    _db = [FMDatabase databaseWithPath:[self dbPath]];
}

//获取db的路径
- (NSString*)dbPath
{
    NSArray* documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* path = [documentPath objectAtIndex:0];
    NSString* dbPath = [path stringByAppendingPathComponent:@"db"];
    return dbPath;
}

//建表
- (void)createTable
{
    [_db open];
    [_db executeUpdate:[NSString stringWithFormat:CREATE_USERINFO_TABLE,TABLE_USERINFO]];
    [_db close];
}

@end





