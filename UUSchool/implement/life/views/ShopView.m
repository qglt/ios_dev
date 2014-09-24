//
//  ShopView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "ShopView.h"
#import "ShopInfo.h"

@implementation ShopView

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
    self.dataCell = NSClassFromString(@"ShopCell");
    [self refreshTableDataWith:[self getListData]];
}

- (NSArray *)getListData
{
    ShopInfo * info1 = [[ShopInfo alloc]initWithDictionary:@{
                                                               @"price": @"49",
                                                               @"originPrice":@"199",
                                                               @"category":@"服装",
                                                               @"subCategory":@"衬衣",
                                                               @"store":@"蒙霸男装",
                                                               @"logitude":@"169.000000",
                                                               @"latitude":@"53.000000",
                                                               @"sales":@"127",
                                                               @"surplus":@"23",
                                                               @"commentary":@"很好很不错",
                                                               @"city":@"呼和浩特",
                                                               @"area":@"海亮广场",
                                                               @"tel":@"0471-666777",
                                                               @"imageUrl":@"http://192.168.2.228/source/3.png",
                                                               @"title":@"暑期促销",
                                                               @"detail":@"",
                                                               @"userID":@"12345"
                                                               }];
    ShopInfo * info2 = [[ShopInfo alloc]initWithDictionary:@{
                                                             @"price": @"99",
                                                             @"originPrice":@"299",
                                                             @"category":@"服装",
                                                             @"subCategory":@"衬衣",
                                                             @"store":@"蒙霸男装",
                                                             @"logitude":@"169.000000",
                                                             @"latitude":@"53.000000",
                                                             @"sales":@"127",
                                                             @"surplus":@"23",
                                                             @"commentary":@"很好很不错",
                                                             @"city":@"呼和浩特",
                                                             @"area":@"海亮广场",
                                                             @"tel":@"0471-666777",
                                                             @"imageUrl":@"http://192.168.2.228/source/4.png",
                                                             @"title":@"新品上市",
                                                             @"detail":@"这是说明: 夏季男装一律4～6折，还有千元大礼包等你来拿",
                                                             @"userID":@"12345"
                                                             }];
    ShopInfo * info3 = [[ShopInfo alloc]initWithDictionary:@{
                                                             @"price": @"49",
                                                             @"originPrice":@"199",
                                                             @"category":@"服装",
                                                             @"subCategory":@"衬衣",
                                                             @"store":@"蒙霸男装",
                                                             @"logitude":@"169.000000",
                                                             @"latitude":@"53.000000",
                                                             @"sales":@"127",
                                                             @"surplus":@"23",
                                                             @"commentary":@"很好很不错",
                                                             @"city":@"呼和浩特",
                                                             @"area":@"海亮广场",
                                                             @"tel":@"0471-666777",
                                                             @"imageUrl":@"http://192.168.2.228/source/3.png",
                                                             @"title":@"精品优惠",
                                                             @"detail":@"",
                                                             @"userID":@"12345"
                                                             }];
    return @[info1,info2,info3,info2,info1];
}
- (void)getRowHeights:(NSArray *)dataArray
{
    for (ShopInfo * info in dataArray) {
        float height = 0.f;
        if (![info.title isEqualToString:@""] && info.title != nil) {
            height += 40.f;
        }
        if (![info.imageUrl isEqualToString:@""] && info.imageUrl !=nil) {
            height += 175.f;
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
    NSLog(@"Select ShopCell with indexPath(%ld,%ld)",(long)indexPath.section,(long)indexPath.row);
}
@end
