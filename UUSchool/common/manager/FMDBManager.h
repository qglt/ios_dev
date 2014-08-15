//
//  FMDBManager.h
//  TtcyMngl
//
//  Created by 牛利江 on 14-6-13.
//  Copyright (c) 2014年 hqglt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
#import "DBManger_Define.h"
#import "AccountInfo.h"
#import <AVFoundation/AVFoundation.h>


@interface FMDBManager : NSObject

{
    FMDatabase *_db;
}

SINGLETON_DEFINE(FMDBManager);

@end
