//
//  BaseMenuView.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-11.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "BaseMenuView.h"
#import "BaseCell.h"

@interface BaseMenuView ()<UITableViewDataSource,UITableViewDelegate>
{
    CGFloat _lastBeganX;
}
@property (nonatomic,strong)UITableView * dataTable;
@property (nonatomic,strong)NSMutableDictionary * tableData;

@end

@implementation BaseMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.dataCell = NSClassFromString(@"RightMenuCell");
        [self setBaseCondition];
        [self createTableView];
        [self addGesture];
    }
    return self;
}
- (void)setBaseCondition
{
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
}

- (void)createTableView
{
    CGRect frame = self.frame;
    frame.origin.x = 0;
    frame.origin.y =40;
    frame.size.height -= 20;
    self.dataTable = [[UITableView alloc]initWithFrame:frame];
    
    _dataTable.dataSource = self;
    _dataTable.delegate = self;
    _dataTable.rowHeight = 80;
    [_dataTable setSectionHeaderHeight:15];
    _dataTable.backgroundColor = [UIColor clearColor];
    _dataTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_dataTable];
}
- (void)refreshTableWithDictionary:(NSDictionary *)dict
{
    self.tableData = [NSMutableDictionary dictionaryWithDictionary:dict];
    [_dataTable reloadData];
}
- (void)addGesture
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragSelf:)];
    [self addGestureRecognizer:pan];
}
- (void)dragSelf:(UIPanGestureRecognizer *)pan {
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            [self beganDrag];
            break;
        case UIGestureRecognizerStateEnded:
            [self endDrag];
            break;
        default:
            [self dragging:pan];
            break;
    }
}

- (void)dragging:(UIPanGestureRecognizer *)pan
{
    CGFloat tx = [pan translationInView:self].x;
    CGRect frame = self.frame;
    CGFloat x = frame.origin.x;
    x = _lastBeganX + tx;
    
    // 过滤
    if (x < 100) {
        x = 100;
    } else if (x > 320) {
        x = 320;
    }
    
    frame.origin.x = x;
    self.frame = frame;
}

- (void)beganDrag
{
    _lastBeganX = self.frame.origin.x;
}

- (void)endDrag
{
    CGRect frame = self.frame;
    
    // 计算x
    CGFloat x = frame.origin.x;
    
    if (x <= 210) {
        x = 100;
    } else {
        x = 320;
        [self.delegate hiddeRightMeun];
    }
    frame.origin.x = x;
    [UIView animateWithDuration:0.15 animations:^{
        self.frame = frame;
    }];
}

#pragma mark - UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    return _tableData.allKeys.count;
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [[_tableData objectForKey:_tableData.allKeys[section]] count];
    return 3;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //    return _tableData.allKeys[section];
    return [NSString stringWithFormat:@"%ld",(long)section];
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
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * label = [[UILabel alloc]init];
    label.backgroundColor = BASE_CONTENT_COLOR;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [self tableView:tableView titleForHeaderInSection:section];
    return label;
}

#pragma mark - UITableViewDelegate methods


@end
