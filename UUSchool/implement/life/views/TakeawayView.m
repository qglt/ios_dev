//
//  TakeawayView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-7.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "TakeawayView.h"

@interface TakeawayView ()


@end

@implementation TakeawayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame andRowHeight:400];
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
    
    self.listData = [NSMutableArray arrayWithArray:@[@"1",@"1",@"1",@"1",@"1"]];
}
-(void)refreshTableDataWith:(NSArray *)dataArray
{
    self.listData = [NSMutableArray arrayWithArray:dataArray];
}

@end
