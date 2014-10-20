//
//  AppCache.h
//  UUSchool
//
//  Created by 青格勒图 on 14-10-14.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ASIDownloadCache.h>

@interface AppCache : NSObject

SINGLETON_DEFINE(AppCache);

-(ASIDownloadCache *)cache;

@end
