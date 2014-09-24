//
//  TeachView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "TeachView.h"
#import "TeachInfo.h"

@implementation TeachView

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
    self.dataCell = NSClassFromString(@"TeachCell");
    [self showMenuButtonWithTitle:@"我的家教"];
    [self refreshTableDataWith:[self getListData]];
}
- (NSArray *)getListData
{
    TeachInfo * info1 = [[TeachInfo alloc]initWithDictionary:@{
                                                             @"price": @"12.5",
                                                             @"subject":@"英语",
                                                             @"category":@"",
                                                             @"location":@"海亮广场",
                                                             @"logitude":@"15",
                                                             @"latitude":@"10",
                                                             @"littleSex":@"男",
                                                             @"grade":@"四年级",
                                                             @"imageUrl":@"http://192.168.2.228/source/1.jpg",
                                                             @"title":@"找家教找家教找家教找家教找家教找家教",
                                                             @"detail":@"这是说明: 家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教。",
                                                             @"userID":@"12345"
                                                             }];
    TeachInfo * info2 = [[TeachInfo alloc]initWithDictionary:@{
                                                               @"price": @"20",
                                                               @"subject":@"数学",
                                                               @"category":@"",
                                                               @"location":@"海亮广场",
                                                               @"logitude":@"20",
                                                               @"latitude":@"10",
                                                               @"littleSex":@"女",
                                                               @"grade":@"三年级",
                                                               @"imageUrl":@"http://192.168.2.228/source/2.jpg",
                                                               @"title":@"找家教",
                                                               @"detail":@"这是说明: 家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教。",
                                                               @"userID":@"12345"
                                                               }];
    TeachInfo * info3 = [[TeachInfo alloc]initWithDictionary:@{
                                                               @"price": @"15",
                                                               @"subject":@"语文",
                                                               @"category":@"",
                                                               @"location":@"海亮广场",
                                                               @"logitude":@"20",
                                                               @"latitude":@"10",
                                                               @"littleSex":@"男",
                                                               @"grade":@"三年级",
                                                               @"imageUrl":@"",
                                                               @"title":@"找家教",
                                                               @"detail":@"这是说明: 家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教。 家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教 家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教 家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教 家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教 家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教家教。",
                                                               @"userID":@"12345"
                                                               }];
    return @[info1,info2,info3,info2,info1];
}
- (void)getRowHeights:(NSArray *)dataArray
{
    for (TeachInfo * info in dataArray) {
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
-(void)refreshTableDataWith:(NSArray *)dataArray
{
    [self getRowHeights:dataArray];
    self.listData = [NSMutableArray arrayWithArray:dataArray];
}
-(void)didSelectCellWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select TeachCell with indexPath(%ld,%ld)",(long)indexPath.section,(long)indexPath.row);
}
@end
