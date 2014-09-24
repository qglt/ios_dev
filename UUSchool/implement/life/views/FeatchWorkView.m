//
//  FeatchWorkView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "FeatchWorkView.h"
#import "WorkInfo.h"
#import <ASIFormDataRequest.h>
#import "JSONKit.h"

@interface FeatchWorkView ()

@property (nonatomic,strong)ASIFormDataRequest * request;

@end

@implementation FeatchWorkView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBase];
    }
    return self;
}
- (void)setBase
{
    self.dataCell = NSClassFromString(@"WorkCell");
    [self showMenuButtonWithTitle:@"我的兼职"];
    [self refreshTableDataWith:[self getListData]];
}
- (NSArray *)getListData
{
    WorkInfo * info1 = [[WorkInfo alloc]initWithDictionary:@{
                                                                     @"price": @"12.5",
                                                                     @"institution":@"产品推广",
                                                                     @"category":@"服务类",
                                                                     @"location":@"海亮广场",
                                                                     @"logitude":@"15",
                                                                     @"latitude":@"10",
                                                                     @"when":@"每周六下午",
                                                                     @"imageUrl":@"http://192.168.2.228/source/1.jpg",
                                                                     @"title":@"周末兼职",
                                                                     @"detail":@"这是说明: jianzhi兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职",
                                                                     @"userID":@"12345"
                                                                     }];
    WorkInfo * info2 = [[WorkInfo alloc]initWithDictionary:@{
                                                             @"price": @"12.5",
                                                             @"institution":@"亿儒科技",
                                                             @"category":@"产品推广",
                                                             @"location":@"海亮广场",
                                                             @"logitude":@"15",
                                                             @"latitude":@"10",
                                                             @"when":@"每周六下午",
                                                             @"imageUrl":@"",
                                                             @"title":@"周末兼职",
                                                             @"detail":@"这是说明: jianzhi兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职jianzhi兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职兼职",
                                                             @"userID":@"12345"
                                                             }];
    [self uploadDict:[info1 dictionary]];
    
    return @[info1,info2,info2,info2,info1];
}
- (void)getRowHeights:(NSArray *)dataArray
{
    for (WorkInfo * info in dataArray) {
        float height = 0.f;
        if (![info.title isEqualToString:@""] && info.title != nil) {
            height += 40.f;
        }
        if (![info.imageUrl isEqualToString:@""] && info.imageUrl !=nil) {
            height += 149.f;
        }
        if (![info.detail isEqualToString:@""] && info.detail !=nil) {
            
            UIFont * font = [UIFont systemFontOfSize:14.0];
            CGSize size = [info.detail sizeWithFont:font constrainedToSize:CGSizeMake(310, 1000) lineBreakMode:NSLineBreakByWordWrapping];
            height += size.height;
        }
        height +=10;
        [self.rowHeights addObject:[NSNumber numberWithFloat:height]];
    }
}
- (void)uploadDict:(NSDictionary *)dict
{
    NSArray * array = [NSArray arrayWithArray:[dict allKeys]];
    self.request = [[ASIFormDataRequest alloc]initWithURL:[NSURL URLWithString:@"http://192.168.2.228/main.php"]];
    
    [_request setRequestMethod:@"POST"];
    [_request setTimeOutSeconds:60];
    [_request addRequestHeader:@"Content-Type" value:@"application/json"];
    [_request setPostValue:@"set" forKey:@"method"];
    [_request setPostValue:@"TakeawayInfo" forKey:@"lifeType"];
    
    for (NSString * key in array) {
        [_request setPostValue:dict[key] forKey:key];
    }
    __unsafe_unretained FeatchWorkView * main = self;
    
    [_request setCompletionBlock:^{
        NSDictionary *dict = [_request.responseString objectFromJSONString];
        NSLog(@"--------responsString = %@",_request.responseString);
    }];
    [_request setFailedBlock:^{
        NSLog(@"－－－－－－－－－－－－－－－－－－－－－－－－－连接错误 。");
    }];
    [_request startAsynchronous];
}
-(void)refreshTableDataWith:(NSArray *)dataArray
{
    [self getRowHeights:dataArray];
    self.listData = [NSMutableArray arrayWithArray:dataArray];
}
-(void)didSelectCellWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select TakeawayCell with indexPath(%ld,%ld)",(long)indexPath.section,(long)indexPath.row);
}
@end
