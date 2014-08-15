//
//  BaseContentView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-6.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "BaseContentView.h"
#import "BaseCell.h"
#import "BaseMenuView.h"

#define MENU_WIDTH 220

@interface BaseContentView ()<UITableViewDataSource,UITableViewDelegate,BaseMenuViewDelegate>
{
    CGFloat _rowHeight;
    
    BOOL navHidde;
    BOOL tabHidde;
    BOOL menuIsShow;
    BOOL rightMenuisShow;
    CGFloat scrollBeganPoint;
}
@property (nonatomic,strong)UITableView * dataTable;
@property (nonatomic,strong)UIButton * menuButton;
@property (nonatomic,strong)BaseMenuView * rightMenuView;

@end

@implementation BaseContentView

- (id)initWithFrame:(CGRect)frame andRowHeight:(CGFloat)rowHeight
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _rowHeight = rowHeight;
        [self setBaseCondition];
        [self createDataTable];
    }
    return self;
}

#pragma mark - initlize methods

- (void)setBaseCondition
{
    self.backgroundColor = BASE_CONTENT_COLOR;
    menuIsShow = NO;
    rightMenuisShow = NO;
    self.rightMenuData = [NSMutableDictionary dictionary];
    scrollBeganPoint = 0;
}
-(void)setlistData:(NSMutableArray *)listData
{
    _listData = listData;
    [_dataTable reloadData];
}
- (void)createDataTable
{
    self.dataTable = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    _dataTable.backgroundColor = [UIColor clearColor];
    _dataTable.dataSource = self;
    _dataTable.delegate = self;
    _dataTable.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    _dataTable.rowHeight = _rowHeight;
    [self insertSubview:_dataTable atIndex:0];
}
- (void)createRightMenuView
{
    self.rightMenuView = [[BaseMenuView alloc]initWithFrame:CGRectMake(kMainScreenWidth, 0, MENU_WIDTH, [[UIScreen mainScreen] bounds].size.height)];
    _rightMenuView.delegate = self;
    [self addSubview:_rightMenuView];
    
}
- (void)createMenuButtonWithTitle:(NSString *)title
{
    CGSize size = [title sizeWithAttributes:@{@"font": [UIFont systemFontOfSize:15.0f]}];
    
    self.menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _menuButton.backgroundColor = [UIColor colorWithWhite:.3f alpha:.9f];
    
    [_menuButton setTitle:title forState:UIControlStateNormal];
    _menuButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [_menuButton addTarget:self action:@selector(showRightMenu) forControlEvents:UIControlEventTouchUpInside];
    _menuButton.translatesAutoresizingMaskIntoConstraints = NO;
    _menuButton.layer.cornerRadius = 35/2;
    _menuButton.layer.masksToBounds = YES;
    
    [self addSubview:_menuButton];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-(%f)-[_menuButton(==%f)]|",kMainScreenWidth-size.width-30,size.width+30] options:0 metrics:nil views:NSDictionaryOfVariableBindings(_menuButton)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[_menuButton(==35)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_menuButton)]];
}
- (void)changeSubViewsFrameWithOparationRightMenu:(BOOL)oparation scale:(BOOL)scale
{
    if (oparation) {
        
        if (scale) {
            
            CGRect frame = _rightMenuView.frame;
            frame.size.height += 20;
            frame.origin.x -= MENU_WIDTH;
            _rightMenuView.frame = frame;
        }else{
            CGRect frame = _rightMenuView.frame;
            frame.size.height -= 20;
            frame.origin.x += MENU_WIDTH;
            _rightMenuView.frame = frame;
        }
    }
    if (scale) {
        
        CGRect frame = _dataTable.frame;
        frame.size.height += 20;
        _dataTable.frame = frame;
        
    }else{
        
        CGRect frame = _dataTable.frame;
        frame.size.height -= 20;
        _dataTable.frame = frame;
    }
}
- (void)showRightMenu
{
    rightMenuisShow = YES;
    [self showRightMenu:YES];
}
- (void)hiddeRightMeun
{
    rightMenuisShow = NO;
    [self showRightMenu:NO];
}
- (void)showRightMenu:(BOOL)show
{
    if (show) {
        
        [UIView animateWithDuration:.3f animations:^{
            [self changeSubViewsFrameWithOparationRightMenu:YES scale:YES];
        }];
        
        if (!navHidde) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HIDDE_NAVIGATION object:nil];
            navHidde = YES;
        }
        if (!tabHidde) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HIDDE_TAB object:nil];
            tabHidde = YES;
        }
    }else{
        
        if (navHidde) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SHOW_NAVIGATION object:nil];
            navHidde = NO;
        }
        if (tabHidde) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SHOW_TAB object:nil];
            tabHidde = NO;
        }
    }
}
#pragma mark - opration methods
- (void)showMenuButtonWithTitle:(NSString *)title
{
    [self createMenuButtonWithTitle:title];
    [self createRightMenuView];
}
- (void)setTableHeader:(UIView *)header
{
    if (header) {
        
    }else{
    
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    BaseCell * cell = (BaseCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[self.dataCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell setUpCellWithData:nil];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (rightMenuisShow) {
        rightMenuisShow = NO;
        [UIView animateWithDuration:.3f animations:^{
            [UIView animateWithDuration:.3f animations:^{
                [self changeSubViewsFrameWithOparationRightMenu:YES scale:NO];
            }];
        }];
        
        if (navHidde) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SHOW_NAVIGATION object:nil];
            navHidde = NO;
        }
        if (tabHidde) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SHOW_TAB object:nil];
            tabHidde = NO;
        }
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!rightMenuisShow) {
        if (scrollView.contentOffset.y >1 && scrollView.contentOffset.y >scrollBeganPoint) {
            if (!(navHidde || tabHidde)) {
                [self changeSubViewsFrameWithOparationRightMenu:NO scale:YES];
            }
            if (!navHidde) {
                [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HIDDE_NAVIGATION object:nil];
                navHidde = YES;
            }
            if (!tabHidde) {
                [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HIDDE_TAB object:nil];
                tabHidde = YES;
            }
        }
        if (scrollView.contentOffset.y < scrollBeganPoint - 80 ||scrollView.contentOffset.y < 1) {
            if (navHidde || tabHidde) {
                [self changeSubViewsFrameWithOparationRightMenu:NO scale:NO];
            }
            if (navHidde) {
                [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SHOW_NAVIGATION object:nil];
                navHidde = NO;
            }
            if (tabHidde) {
                [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SHOW_TAB object:nil];
                tabHidde = NO;
            }
            
        }
    }
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    scrollBeganPoint = scrollView.contentOffset.y;
}
@end
