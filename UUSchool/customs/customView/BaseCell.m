//
//  BaseCell.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "BaseCell.h"

@interface BaseCell ()

@end


@implementation BaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setBaseCondition];
        [self createImageView];
        [self createTitleLabel];
        [self createDetailLabel];
        [self createOtherView];
    }
    return self;
}
- (void)setBaseCondition
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self clean];
}
- (void)clean
{
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[UILabel class]]||[obj isKindOfClass:[UIImageView class]]||[obj isMemberOfClass:[UIView class]]) {
            [obj removeFromSuperview];
        }
    }
}
- (void)createImageView
{
    self.image_H = [[UIImageView alloc]init];
    _image_H.backgroundColor = [UIColor redColor];
    _image_H.translatesAutoresizingMaskIntoConstraints = NO;
}
- (void)createTitleLabel
{
    self.titleText = [[UILabel alloc]init];
    _titleText.font = [UIFont boldSystemFontOfSize:16.0f];
    _titleText.backgroundColor = [UIColor greenColor];
    _titleText.text = @"这是标题 !";
    _titleText.textAlignment = NSTextAlignmentLeft;
    _titleText.textColor = [UIColor blackColor];
    _titleText.translatesAutoresizingMaskIntoConstraints = NO;
    _titleText.numberOfLines = 0;
    _titleText.lineBreakMode = NSLineBreakByWordWrapping;
}
- (void)createDetailLabel
{
    self.detailText = [[UILabel alloc]init];
    _detailText.font = [UIFont systemFontOfSize:14.0f];
    _detailText.backgroundColor = [UIColor whiteColor];
    _detailText.textAlignment = NSTextAlignmentCenter;
    _detailText.textColor = [UIColor blackColor];
    _detailText.translatesAutoresizingMaskIntoConstraints = NO;
    _detailText.text = @"这是内容介绍区域。";
    _detailText.numberOfLines = 0;
    _detailText.lineBreakMode = NSLineBreakByWordWrapping;
}
- (void)createOtherView
{
    self.otherView = [[UIView alloc]init];
    _otherView.backgroundColor = [UIColor clearColor];
    _otherView.backgroundColor = [UIColor brownColor];
    _otherView.translatesAutoresizingMaskIntoConstraints = NO;
}
-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderWidth = 5;
    self.layer.shadowOffset = CGSizeMake(3, 5);
    self.layer.borderColor = _borderColor.CGColor;
}
- (void)setCellType:(BaseCellType)type
{
    switch (type) {
        
        case BaseCellTypeDefult:
        {
            [self addSubview:_image_H];
            [self addSubview:_titleText];
            [self addSubview:_detailText];
        }break;
            
        case BaseCellTypeDetailAndTitle:
        {
            [self addSubview:_titleText];
            [self addSubview:_detailText];
        }break;
        
        case BaseCellTypeImageAndTitle:
        {
            [self addSubview:_image_H];
            [self addSubview:_titleText];
        }break;
            
        case BaseCellTypeOtherAndTitle:
        {
            [self addSubview:_otherView];
            [self addSubview:_titleText];
        }break;
            
        case BaseCellTypeOtherDetailAndTitle:
        {
            [self addSubview:_otherView];
            [self addSubview:_titleText];
            [self addSubview:_detailText];
        }break;
        
        case BaseCellTypeOtherImageAndTitle:
        {
            [self addSubview:_image_H];
            [self addSubview:_titleText];
            [self addSubview:_otherView];
        }break;
            
        case BaseCellTypeOtherDetailImageAndTitle:
        {
            [self addSubview:_otherView];
            [self addSubview:_image_H];
            [self addSubview:_titleText];
            [self addSubview:_detailText];
        }break;
            
        default:
            break;
    }
    [self changeConstrainsWithCellType:type];
}
- (void)changeConstrainsWithCellType:(BaseCellType)type
{
    switch (type) {
        case BaseCellTypeDefult:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-10]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:174]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
            
            //-----------------------titleText----------constrains--------------------
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeHeight multiplier:0 constant:40]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            
            //-----------------------detailText----------constrains--------------------
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-5]];
            
        }break;
        
        case BaseCellTypeDetailAndTitle:
        {
            //-----------------------titleText----------constrains--------------------
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-10]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:40]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
            
            //-----------------------detailText----------constrains--------------------
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-5]];
            
        }break;
            
        case BaseCellTypeImageAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-10]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:174]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
            
            //-----------------------titleText----------constrains--------------------
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-5]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            
        }break;
            
        case BaseCellTypeOtherAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-10]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:40]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
            
            //-----------------------titleText----------constrains--------------------
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-5]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            
        }break;
            
        case BaseCellTypeOtherDetailAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:-10]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0 constant:45]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-55]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:40]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-5]];
            
        }break;
            
        case BaseCellTypeOtherDetailImageAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:194]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0 constant:45]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:149]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-10]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-5]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        }break;
            
        case BaseCellTypeOtherImageAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:-10]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0 constant:45]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
        
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-55]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:149]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image_H attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
            
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_image_H attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            
        }break;
            
        default:
            break;
    }
}
@end
