//
//  HUD.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-22.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "HUD.h"

@interface HUD ()
{
    BOOL _image;
    CGFloat _messageHeight;
    BOOL _title;
    
    NSUInteger _otherButtonCount;
}
@property (nonatomic,strong,setter = setImage:)UIImageView * imageView;

@property (nonatomic,strong,setter = setMessage:)UILabel * messageLabel;

@property (nonatomic,strong,setter = setTitle:)UILabel * titleLabel;

@property (nonatomic,strong)NSMutableArray * otherButtonTitles;

@end


@implementation HUD

- (id)initWithTitle:(NSString*)title message:(NSString *)message image:(NSString *)image cancel:(NSString *)cancelTitle other:(NSArray *)otherTitles
{
//    _title = (![@"" isEqualToString:title] || title !=nil);
//    _image = (![@"" isEqualToString:image] || image !=nil);
//    _otherButtonCount = otherTitles.count;
//    
//    CGSize size = [message sizeWithFont:[UIFont systemFontOfSize:15.0] constrainedToSize:CGSizeMake(190, 200)];
//    _messageHeight = size.height;
    CGRect frame = CGRectZero;
    
    if (_otherButtonCount > 1) {
        frame = CGRectMake(0, 0, 200, _title * 40 + _messageHeight + _image * 106 + (_otherButtonCount+1));
    }
    
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBaseCondition];
        if (_title) {
            [self createTitleLabel];
        }
        
    }
    return self;
}

- (void)setBaseCondition
{
    self.backgroundColor = [UIColor whiteColor];
}

- (void)createImageView
{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 190, 106)];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_imageView];
}

- (void)createTitleLabel
{

}

- (void)createMessageLabel
{

}

- (void)createCancelButton
{

}

- (void)createOtherButton
{

}

+ (void)showMessage:(NSString *)message image:(NSString *)imageName title:(NSString *)title cancelButton:(NSString *)cancelTitle otherButtons:(NSString *)other,...
{
    HUD * hud = [[HUD alloc]init];
    
    NSMutableArray * otherButtons = [NSMutableArray array];
    
    va_list args;
    va_start(args, other);
    
    if (other) {
        NSString * otherString;
        
        while ((otherString = va_arg(args, NSString *))){
            [otherButtons addObject:otherString];
        }
    }
    va_end(args);
    
}

@end
