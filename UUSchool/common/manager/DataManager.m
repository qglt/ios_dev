//
//  DataManager.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-12.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "DataManager.h"
#import "HTTPRequestManager.h"
#import "JSONKit.h"
#import "ResultInfo.h"

@interface DataManager()

@end

@implementation DataManager

SINGLETON_IMPLEMENT(DataManager);

-(id)init
{
    self = [super init];
    if (self) {
        [self configRequestManager];
    }
    return self;
}
- (void)configRequestManager
{
    __unsafe_unretained DataManager * main = self;
    
    listener = ^(NSDictionary* result){
        
        ResultInfo *resultInfo =[main parseCommandResusltInfo:result];
        if (resultInfo.succeed) {
            [main sendRequestFinishToDelegate:result[@"data"]];
        }else{
            [main sendRequestFaillerToDelegate:resultInfo.errorMsg];
        }
    };
}

#pragma mark - 生活部分数据处理的主要方法－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
- (void)getLifeContentDataWithLifeType:(NSString *)lifeType category:(NSString *)category subCategory:(NSString *)subCategory pageCount:(int)pageCount
{
    NSDictionary * paramDict = @{
                                 @"lifeType":lifeType,
                                 @"category":category,
                                 @"subCategory":subCategory,
                                 @"pageCount":[NSString stringWithFormat:@"%d",pageCount]
                                 };
    
    [[HTTPRequestManager shareInstance] requestForServer:1 method:@"get" paramDict:paramDict];
}
- (void)uploadLifeDataToLifeType:(NSString *)keyString dataDict:(NSDictionary *)dict
{

}

-(ResultInfo *)parseCommandResusltInfo:(NSDictionary *)data
{
    ResultInfo * result = [[ResultInfo alloc]init];
    if ([@"ok" isEqualToString:[data objectForKey:@"errorMsg"]]) {
        result.succeed = YES;
        
    }else{
        result.errorMsg = [data objectForKey:@"errorMsg"];
    }
    return result;
}
- (void)sendRequestFinishToDelegate:(NSArray *)dataArray
{
    if ([self.delegate respondsToSelector:@selector(requestFinish:)]) {
        [self.delegate requestFinish:dataArray];
    }
}
- (void)sendRequestFaillerToDelegate:(NSString *)errorMsg
{
    if ([self.delegate respondsToSelector:@selector(requestFailler:)]) {
        [self.delegate requestFailler:errorMsg];
    }
}

@end
