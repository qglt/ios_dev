//
//  RightMenuCell.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-11.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "RightMenuCell.h"

@implementation RightMenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.borderColor = BASE_CONTENT_COLOR;
    }
    return self;
}
-(void)setUpCellWithData:(NSData *)data
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    label.center = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
    label.text = @"这是 RightMenu cell !";
    
    [self addSubview:label];
}

@end
