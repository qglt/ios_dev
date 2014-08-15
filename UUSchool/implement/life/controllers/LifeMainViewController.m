//
//  LifeMainViewController.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-5.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "LifeMainViewController.h"
#import "TakeawayView.h"

@interface LifeMainViewController ()
{
    BOOL first;
}
@end

@implementation LifeMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"生活";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBaseCondition];
    [self createContentView];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!first) {
        Class c = [self.view.subviews[0] class];
        NSString * str = NSStringFromClass(c);
        str = [str substringToIndex:str.length-4];
        NSLog(@"============================== %@",str);
    }
    first = NO;
}
- (void)setBaseCondition
{
    self.title = @"生活";
    self.view.backgroundColor = BASE_CONTENT_COLOR;
    first = YES;
    if (isIOS7) {
        self.extendedLayoutIncludesOpaqueBars = NO;
    }
}
- (void)createContentView
{
    TakeawayView * content = [[TakeawayView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:content];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
