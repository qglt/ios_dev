//
//  BaseCell.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "BaseCell.h"

@interface BaseCell ()

@property (nonatomic,strong)UIImageView * image;

@property (nonatomic,strong)UILabel * titleText;

@property (nonatomic,strong)UILabel * detailText;

@property (nonatomic,strong)UIView * otherView;

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
    self.layer.borderWidth = 5;
    self.layer.shadowOffset = CGSizeMake(3, 5);
    self.layer.borderColor = BASE_CONTENT_COLOR.CGColor;
    [self clean];
}
- (void)clean
{
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[UILabel class]]||[obj isKindOfClass:[UIImageView class]]) {
            [obj removeFromSuperview];
        }
    }
}
- (void)createImageView
{
    self.image = [[UIImageView alloc]init];
    _image.backgroundColor = [UIColor redColor];
    _image.translatesAutoresizingMaskIntoConstraints = NO;
}
- (void)createTitleLabel
{
    self.titleText = [[UILabel alloc]init];
    _titleText.font = [UIFont systemFontOfSize:18.0f];
    _titleText.backgroundColor = [UIColor greenColor];
    _titleText.text = @"这是标题 !";
    _titleText.textAlignment = NSTextAlignmentLeft;
    _titleText.textColor = [UIColor blackColor];
    _titleText.translatesAutoresizingMaskIntoConstraints = NO;
    
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
}
- (void)createOtherView
{
    self.otherView = [[UIView alloc]init];
    _otherView.backgroundColor = [UIColor clearColor];
    _otherView.backgroundColor = [UIColor brownColor];
    _otherView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)setCellType:(BaseCellType)type
{
    switch (type) {
        
        case BaseCellTypeDefult:
        {
            [self addSubview:_image];
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
            [self addSubview:_image];
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
            [self addSubview:_image];
            [self addSubview:_titleText];
            [self addSubview:_otherView];
        }break;
            
        case BaseCellTypeOtherDetailImageAndTitle:
        {
            [self addSubview:_otherView];
            [self addSubview:_image];
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
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-10]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            
            ///////////////////////////////////
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_image(==175)][_titleText(==25)][_detailText(==30)]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_image,_titleText,_detailText)]];
            
        }break;
        
        case BaseCellTypeDetailAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-10]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_titleText(==45)][_detailText(==145)]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleText,_detailText)]];
            
        }break;
            
        case BaseCellTypeImageAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-10]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_image(==175)][_titleText(==25)]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_image,_titleText)]];
            
        }break;
            
        case BaseCellTypeOtherAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-10]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_otherView(==45)][_titleText]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_otherView,_titleText)]];
            
        }break;
            
        case BaseCellTypeOtherDetailAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:-10]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-55]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:50]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_titleText attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[_otherView(==45)][_titleText]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_otherView,_titleText)]];
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_titleText(==45)][_detailText(==145)]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleText,_detailText)]];
            
        }break;
            
        case BaseCellTypeOtherDetailImageAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:194]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0 constant:45]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-55]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:149]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-10]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_detailText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        }break;
            
        case BaseCellTypeOtherImageAndTitle:
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:-10]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0 constant:45]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_otherView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:-55]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:149]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_image attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_otherView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_image attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
            
        }break;
            
        default:
            break;
    }
}
@end
