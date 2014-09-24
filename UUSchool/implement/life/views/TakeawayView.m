//
//  TakeawayView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-7.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "TakeawayView.h"
#import "TakeawayInfo.h"

@interface TakeawayView ()

@end

@implementation TakeawayView

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
    [self showMenuButtonWithTitle:@"我吃了什么"];
    self.dataCell = NSClassFromString(@"TakeawayCell");
}
- (void)getRowHeights:(NSArray *)dataArray
{
    for (TakeawayInfo * info in dataArray) {
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
        TakeawayInfo * info = [[TakeawayInfo alloc]initWithDictionary:dict];
        [data addObject:info];
    }
    return data;
}
-(void)didSelectCellWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select TakeawayCell with indexPath(%ld,%ld)",(long)indexPath.section,(long)indexPath.row);
}

@end
