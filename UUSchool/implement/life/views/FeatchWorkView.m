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
-(void)refreshTableDataWith:(NSMutableArray *)dataArray
{
    NSMutableArray * array = [self configDataWithArray:dataArray];
    [self getRowHeights:array];
    self.listData = array;
}
- (NSMutableArray *)configDataWithArray:(NSArray *)array
{
    NSMutableArray * data = [NSMutableArray array];
    for (NSDictionary * dict in array) {
        WorkInfo * info = [[WorkInfo alloc]initWithDictionary:dict];
        [data addObject:info];
    }
    return data;
}
-(void)didSelectCellWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select TakeawayCell with indexPath(%ld,%ld)",(long)indexPath.section,(long)indexPath.row);
}
@end
