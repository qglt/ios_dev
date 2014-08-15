//
//  FeatchWorkView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "FeatchWorkView.h"

@implementation FeatchWorkView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame andRowHeight:200];
    if (self) {
        // Initialization code
        [self setBase];
    }
    return self;
}
- (void)setBase
{
    self.dataCell = NSClassFromString(@"WorkCell");
    self.listData = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6"]];
    [self showMenuButtonWithTitle:@"我的兼职"];
}

@end
