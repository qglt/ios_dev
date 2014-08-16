//
//  TeachCell.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "TeachCell.h"

@implementation TeachCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        [self setCellType:BaseCellTypeOtherDetailAndTitle];
    }
    return self;
}
-(void)setUpCellWithData:(NSData *)data
{


}

@end
