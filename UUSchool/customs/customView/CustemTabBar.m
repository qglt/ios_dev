//
//  CustemTabBar.m
//  TtcyMngl
//
//  Created by admin on 14-6-9.
//  Copyright (c) 2014年 hqglt. All rights reserved.
//

#import "CustemTabBar.h"
#import "Utils.h"

@interface CustemTabBar ()

@property (nonatomic,strong)UIView * selectBG;

@end

@implementation CustemTabBar

-(CustemTabBar *)initWithFrame:(CGRect)frame andItems:(NSArray *)itemsArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.menuItems = [NSMutableArray arrayWithArray:itemsArray];
        [self addLine];
        [self createSelectBG];
        [self createItems];
    }
    return self;
}
-(void)addLine
{
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 0.5)];
    line.backgroundColor = [Utils colorWithHexString:@"#33ffff"];
    [self addSubview:line];
}
-(void)createSelectBG
{
    self.selectBG = [[UIView alloc]initWithFrame:CGRectMake(0, 2.5, self.bounds.size.width/self.menuItems.count-1, self.bounds.size.height-4)];
    _selectBG.backgroundColor = [Utils colorWithHexString:@"#66eeee"];
    _selectBG.layer.cornerRadius = _selectBG.frame.size.height/2;
    _selectBG.layer.masksToBounds = YES;
    
    [self addSubview:_selectBG];
}
-(void)createItems
{
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width/self.menuItems.count, self.bounds.size.height);
    CGFloat x = kMainScreenWidth/(self.menuItems.count * 2);
    
    for (int i = 0; i<_menuItems.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = rect;
        button.center = CGPointMake(x, self.bounds.size.height/2.0f);
        
        button.titleLabel.font = [UIFont fontWithName:@"Menksoft Qagan" size:18.0f];
        
        [button setTitleColor:[Utils colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        [button setTitleColor:[Utils colorWithHexString:@"#eeeeee"] forState:UIControlStateSelected];
        [button setTitleColor:[Utils colorWithHexString:@"#eeeeee"] forState:UIControlStateHighlighted];
        
        [button setTitle:((MenuItem *)_menuItems[i]).title forState:UIControlStateNormal];
        button.tag = ((MenuItem *)_menuItems[i]).tag;
        
        button.backgroundColor = [UIColor clearColor];
        button.titleLabel.numberOfLines = 0;
        
        [button setImage:[UIImage imageNamed:((MenuItem *)_menuItems[i]).icon] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:((MenuItem *)_menuItems[i]).h_icon] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:((MenuItem *)_menuItems[i]).h_icon] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(menuItemClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        x+=kMainScreenWidth/self.menuItems.count;
    }
}

-(void)menuItemClicked:(UIButton *)sender
{
    _itemClick(_menuItems[sender.tag-10000]);
}

-(void)setSelectedWithItemTag:(NSUInteger)itemTag
{
    UIButton * button = (UIButton *)[self viewWithTag:itemTag];
    
    [UIView animateWithDuration:.2f animations:^{
        _selectBG.center = CGPointMake(button.center.x, _selectBG.center.y);
    }];
}
@end
