//
//  TeachCell.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "TeachCell.h"
#import "TeachInfo.h"

@interface TeachCell ()
{
    int cellTypeNumber;
}
@end

@implementation TeachCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.borderColor = BASE_CONTENT_COLOR;
    }
    return self;
}
-(void)setUpCellWithData:(id)data
{
    TeachInfo * info = data;
    
    if (![info.title isEqualToString:@""] && info.title != nil) {
        cellTypeNumber += 14;
        self.titleText.text = [NSString stringWithFormat:@"%@   %@ %@ 一小时 %@元",info.title,info.grade,info.subject,info.price];
    }
    if (![info.imageUrl isEqualToString:@""] && info.imageUrl !=nil) {
        cellTypeNumber += 15;
        [self.image_H sd_setImageWithURL:[NSURL URLWithString:info.imageUrl]];
    }
    if (![info.detail isEqualToString:@""] && info.detail !=nil) {
        cellTypeNumber += 6;
        self.detailText.text = info.detail;
    }
    [self setCellType:cellTypeNumber];
}

@end
