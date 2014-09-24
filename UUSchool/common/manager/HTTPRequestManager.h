//
//  HTTPRequestManager.h
//  UUSchool
//
//  Created by 青格勒图 on 14-9-1.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ASIFormDataRequest.h>

void(^listener)(NSDictionary *);

@interface HTTPRequestManager : NSObject<ASIHTTPRequestDelegate>

@property (nonatomic,strong)ASIFormDataRequest *request;

SINGLETON_DEFINE(HTTPRequestManager);

- (void)requestForServer:(int)serverType method:(NSString *)methodStr paramDict:(NSDictionary *)paramDict;

- (void)requestForServer:(int)serverType method:(NSString *)methodStr paramJson:(NSString *)paramJson;

@end
