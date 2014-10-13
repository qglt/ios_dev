//
//  HTTPRequestManager.m
//  UUSchool
//
//  Created by 青格勒图 on 14-9-1.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "HTTPRequestManager.h"
#import "JSONKit.h"

@implementation HTTPRequestManager

SINGLETON_IMPLEMENT(HTTPRequestManager)

-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)requestForServer:(int)serverType method:(NSString *)methodStr paramDict:(NSDictionary *)paramDict
{
    
    NSString * server = nil;
    if (serverType == 1) {
        server = @"http://192.168.2.228/main.php";
    }
    NSURL * url = [[NSURL alloc]initWithString:server];
    
    [self setRequestCondition:url];
    
    [_request setPostValue:methodStr forKey:@"method"];
    NSArray * array = [paramDict allKeys];
    
    for (NSString * key in array) {
        [_request setPostValue:paramDict[key] forKey:key];
    }
    [_request startAsynchronous];
}

- (void)requestForServer:(int)serverType method:(NSString *)methodStr paramJson:(NSString *)paramJson
{
    NSDictionary * paramDict = [paramJson objectFromJSONString];
    [self requestForServer:serverType method:methodStr paramDict:paramDict];
}


- (void)requestDidFailler:(ASIFormDataRequest * )request
{
    NSDictionary *dict = @{@"errorMsg": @"链接错误 "};
    
    listener(dict);
}

//非200的请求错误，200是成功,//500 服务器的内部错误  返回html内容  //---------501 未实现-------502 网关出错--------405 不允许此方法-------400 请求出错 //404 找不到
- (void)requestDidFinish:(ASIFormDataRequest * )request
{
    if(request.responseStatusCode!=200){
        
        if(request.responseStatusCode==500){
            LOG_GENERAL_ERROR(@"%s 服务器出错!",__FUNCTION__);
            NSDictionary * dict = @{@"errorMsg": @"服务器出错!"};
            listener(dict);
        }else if(request.responseStatusCode==404){
            LOG_GENERAL_ERROR(@"%s 找不到相关资源!",__FUNCTION__);
            NSDictionary * dict = @{@"errorMsg": @"找不到相关资源!"};
            listener(dict);
        }else{
            LOG_GENERAL_ERROR(@"%s 请求失败!",__FUNCTION__);
            NSDictionary * dict = @{@"errorMsg": @"请求失败!"};
            listener(dict);
        }
        return;
    }
    NSString *responseString = request.responseString;
    
    if(!responseString||[@"" isEqualToString:responseString]){
        LOG_GENERAL_ERROR(@"网络无返回 ！");
        
        NSDictionary * dict = @{@"errorMsg": @"网络无返回！"};
        listener(dict);
        return;
    }
    
    NSDictionary *dict = [_request.responseString objectFromJSONString];
    NSDictionary *dict1 = dict[@"returnMsg"];
    NSArray * array = dict1[@"data"];
    if(array.count <1){
        LOG_GENERAL_ERROR(@"暂无数据");
        
        NSDictionary * dict = @{@"errorMsg": @"暂无数据!"};
        listener(dict);
        return;
    }
    
    listener(dict1);
}

- (void)setRequestCondition:(NSURL *)url
{
    self.request = [[ASIFormDataRequest alloc]initWithURL:url];
    [_request setRequestMethod:@"POST"];
    [_request setTimeOutSeconds:60];
    [_request addRequestHeader:@"Content-Type" value:@"application/json"];
    _request.delegate = self;
    [_request setDidFinishSelector:@selector(requestDidFinish:)];
    [_request setDidFailSelector:@selector(requestDidFailler:)];
}

@end
