//
//  CoupenCell.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "CoupenCell.h"

@implementation CoupenCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor brownColor];
        [self setCellType:BaseCellTypeImageAndTitle];
    }
    return self;
}

-(void)setUpCellWithData:(NSData *)data
{
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
//    label.center = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
//    label.text = @"这是 优惠券 cell !";
//    
//    [self addSubview:label];
}

@end
