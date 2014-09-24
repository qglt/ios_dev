//
//  CoupenView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "CoupenView.h"

@implementation CoupenView

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
    self.dataCell = NSClassFromString(@"CoupenCell");
    self.rowHeights = @[[NSNumber numberWithFloat:215.f],[NSNumber numberWithFloat:215.f],
                        [NSNumber numberWithFloat:215.f],[NSNumber numberWithFloat:215.f],
                        [NSNumber numberWithFloat:215.f],[NSNumber numberWithFloat:215.f]
                        ];
    self.listData = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6"]];
}
-(void)didSelectCellWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select GroupenCell with indexPath(%ld,%ld)",(long)indexPath.section,(long)indexPath.row);
}
@end
