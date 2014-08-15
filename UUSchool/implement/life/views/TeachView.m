//
//  TeachView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "TeachView.h"

@implementation TeachView

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
    self.dataCell = NSClassFromString(@"TeachCell");
    self.listData = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6"]];
    [self showMenuButtonWithTitle:@"我的家教"];
}
@end
