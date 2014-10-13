//
//  LifeMainViewController.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-5.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "LifeMainViewController.h"
#import "BaseContentView.h"
#import <ASIFormDataRequest.h>
#import "JSONKit.h"
#import "DataManager.h"

@interface LifeMainViewController ()<DataManagerDelegate>
{
    BOOL first;
    NSString * viewType;
}
@property (nonatomic,strong) BaseContentView * currentContent;
@property (nonatomic,strong)ASIFormDataRequest * request;
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
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.currentContent = self.view.subviews[0];
    Class c = [self.currentContent class];
    NSString * str = NSStringFromClass(c);
    viewType = [str substringToIndex:str.length-4];
    [self getListDataWithView:viewType];
    
}
- (void)setBaseCondition
{
    self.view.backgroundColor = BASE_CONTENT_COLOR;
    first = YES;
    [DataManager shareInstance].delegate = self;
    if (isIOS7) {
        self.extendedLayoutIncludesOpaqueBars = NO;
    }
}
- (void)getListDataWithView:(NSString *)type   // viewType  是标记当前视图是哪个视图，（Takeaway，FeatchWork，。。。）；
{
    [[DataManager shareInstance] getLifeContentDataWithLifeType:type category:@"" subCategory:@"" pageCount:1];
}
- (void)uploadData:(NSDictionary *)dataDict withType:(NSString *)type
{
    [[DataManager shareInstance] uploadLifeDataToLifeType:type dataDict:dataDict];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)requestFinish:(NSArray *)requestData
{
    [_currentContent refreshTableDataWith:requestData];
}
- (void)requestFailler:(NSString *)errorMsg
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@""
                                                    message:errorMsg
                                                   delegate:self
                                          cancelButtonTitle:@"知道了"
                                          otherButtonTitles: nil];
    [alert show];
}
@end
