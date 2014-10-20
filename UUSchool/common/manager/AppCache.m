//
//  AppCache.m
//  UUSchool
//
//  Created by 青格勒图 on 14-10-14.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "AppCache.h"

@interface AppCache ()

@property (nonatomic,strong) ASIDownloadCache *myCache;

@end

@implementation AppCache
SINGLETON_IMPLEMENT(AppCache);

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBaseCondition];
    }
    return self;
}

- (void)setBaseCondition
{
    self.myCache = [ASIDownloadCache sharedCache];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString *cacheDirectory = [paths objectAtIndex:0];
    
    [self.myCache setStoragePath:[cacheDirectory stringByAppendingPathComponent:@"resource"]];
    
    [self.myCache setDefaultCachePolicy:ASIOnlyLoadIfNotCachedCachePolicy];
}
-(ASIDownloadCache *)cache
{
    return _myCache;
}
@end
