//
//  WorkCell.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "WorkCell.h"

@implementation WorkCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor greenColor];
        [self setCellType:BaseCellTypeOtherImageAndTitle];
    }
    return self;
}
-(void)setUpCellWithData:(NSData *)data
{
    
}

@end
