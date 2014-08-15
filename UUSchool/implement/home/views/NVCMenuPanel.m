//
//  NVCMenuPanel.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-5.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "NVCMenuPanel.h"

@interface NVCMenuPanel ()

@property (nonatomic,strong)UIView * panel;

@end

@implementation NVCMenuPanel

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:30.0f/255 green:30.0f/255 blue:30.0f/255 alpha:.7];
        self.alpha = 0;
        [self createPanel];
    }
    return self;
}
-(void)setMenuItems:(NSMutableArray *)menuItems
{
    _menuItems = menuItems;
    
    [self clean];
    CGRect newRect = CGRectMake(0, 0, kMainScreenWidth, (_menuItems.count + 3)/4 * (self.bounds.size.width/4+8));
    
    [self changeConditionWithFrame:newRect];
    [self createItems];
}
- (void)showPanel:(BOOL)show
{
    if (show) {
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 1;
        }];
    }else{
        [UIView animateWithDuration:0.2f animations:^{
            self.alpha = 0;
        }];
    }
}
- (void)createPanel
{
    self.panel = [[UIView alloc]init];
    _panel.backgroundColor = [Utils colorWithHexString:@"#ffffff"];
    [self addSubview:_panel];
}
-(void)createItems
{
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width/4-1, self.bounds.size.width/4-1);
    
    NSInteger index = 0;
    
    for (int i = 0; i<_menuItems.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = rect;
        
        CGFloat centerX = kMainScreenWidth/8.0 + ((index%4) * kMainScreenWidth/4.0);
        CGFloat centerY = kMainScreenWidth/8.0 + ((index/4) * kMainScreenWidth/4.0)+(index/4)*5+5;
        
        button.center = CGPointMake(centerX, centerY);
        
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        
        [button setTitleColor:[Utils colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        [button setTitleColor:[Utils colorWithHexString:@"#eeeeee"] forState:UIControlStateSelected];
        [button setTitleColor:[Utils colorWithHexString:@"#eeeeee"] forState:UIControlStateHighlighted];
        
        [button setTitle:((MenuItem *)_menuItems[i]).title forState:UIControlStateNormal];
        button.tag = ((MenuItem *)_menuItems[i]).tag;
        
        button.backgroundColor = [UIColor colorWithRed:255.0f/255 green:0 blue:0 alpha:.6f];
        button.titleLabel.numberOfLines = 0;
        
        [button setImage:[UIImage imageNamed:((MenuItem *)_menuItems[i]).icon] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:((MenuItem *)_menuItems[i]).h_icon] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:((MenuItem *)_menuItems[i]).h_icon] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(menuItemClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_panel addSubview:button];
        
        index ++;
    }
}
- (void)clean
{
    for (id subview in _panel.subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            [subview removeFromSuperview];
        }
    }
}
- (void)changeConditionWithFrame:(CGRect)frame
{
    _panel.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
//    [self addLine:frame.size.height];
}

-(void)menuItemClicked:(UIButton *)sender
{
    _itemClick(_menuItems[sender.tag-20000]);
}

-(void)setSelectedWithItemTag:(NSUInteger)itemTag
{
    
    
}

@end
