//
//  UUMainViewController.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-4.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "UUMainViewController.h"

#import "CustemTabBar.h"
#import "UIBarButtonItem+Addition.h"
#import "NVCMenuPanel.h"
#import "UIViewController+ReplaceView.h"

@interface UUMainViewController ()<UINavigationControllerDelegate>
{
    BOOL menuShow;
    UIButton * _nvButton;
    NSString * currentNvcMenu;
    NSLayoutConstraint * navConstraint;
}
@property (nonatomic ,strong)CustemTabBar * tab;
@property (nonatomic ,strong)UINavigationController * navigation;
@property (nonatomic ,strong)NVCMenuPanel * menuPanel;
@property (nonatomic ,strong)NSArray * itemsArray;       //nvcItems
@property (nonatomic ,strong)NSMutableArray * selectedItems;
@property (nonatomic ,strong)NSMutableDictionary * menuTag;
@property (nonatomic ,copy)NSString * currentTab;

@end

@implementation UUMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    getTopDistance();
    
    
    [self createTabBar];
    [self createContentView];
    [self addTabToView];
    [self createNVMenuPanel];
    [self addNotification];
    
}
#pragma mark - initlizedView
- (void)createNVMenuPanel
{
    menuShow = NO;
    self.menuPanel = [[NVCMenuPanel alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight)];
    __unsafe_unretained UUMainViewController * main = self;
    _menuPanel.itemClick = ^(MenuItem * item){
        
        Class c = NSClassFromString(item.vcClass);
        UIView * view = [[c alloc]initWithFrame:kMainScreenFrame];
        [main.navigation.topViewController replaceDisplayViewWithView:view];
        
        menuShow = NO;
        [main.menuPanel showPanel:menuShow];
        
        [self changeNavImage];
        
        [_nvButton setTitle:item.title forState:UIControlStateNormal];
        
        currentNvcMenu = [NSString stringWithFormat:@"%lu",item.tag - 20000];
        [main.menuTag setObject:currentNvcMenu forKey:_currentTab];
        
    };
}
-(void)createTabBar
{
    getTopDistance();
    
    self.itemsArray = [NSArray arrayWithObjects:MENU_STUDY_ITEMS,MENU_LIFE_ITEMS,MENU_SCHOOL_ITEMS,MENU_MINE_ITEMS, nil];
    
    self.menuTag = [NSMutableDictionary dictionaryWithObjects:@[@"技能",@"生活",@"动态",@"我"] forKeys:@[@"0",@"0",@"0",@"0"]];
    
    self.tab = [[CustemTabBar alloc]initWithFrame:CGRectMake(0, kMainScreenHeight-TopBarHeight+topDistance, kMainScreenWidth, TopBarHeight) andItems:TAB_ITEMS];
    _tab.backgroundColor = NVC_COLOR;
    
    __unsafe_unretained UUMainViewController *main = self;
    
    _tab.itemClick = ^(MenuItem *item) {
        
        Class c = NSClassFromString(item.vcClass);
        
        UIViewController *vc = [[c alloc] init];
        main.currentTab = vc.title;
        
        [main.navigation setViewControllers:@[vc]];
        main.selectedItems = [NSMutableArray arrayWithArray:main.itemsArray[item.tag-10000]];
        
        [main.tab setSelectedWithItemTag:item.tag];
        
        menuShow = NO;
    };
    
    if (isIOS7) {
        self.extendedLayoutIncludesOpaqueBars = NO;
    }
}
-(void)createContentView
{
    self.view.backgroundColor = NVC_COLOR;
    
    self.navigation = [[UINavigationController alloc]init];
    
    [_navigation.navigationBar setBackgroundImage:[Utils createImageWithColor:NVC_COLOR] forBarMetrics:UIBarMetricsDefault];
    
    _navigation.delegate = self;

    _navigation.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    _tab.itemClick(_tab.menuItems[1]);
    
    [self addChildViewController:_navigation];
    
    [self.view addSubview:_navigation.view];
    
    navConstraint = [NSLayoutConstraint constraintWithItem:_navigation.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    [self.view addConstraint:navConstraint];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_navigation.view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_navigation.view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
}
- (void)createNVMenuButton
{
    _nvButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _nvButton.frame = CGRectMake(0, 0, 120, 35);
    
    [_nvButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_nvButton setTitleColor:[Utils colorWithHexString:@"#999999"] forState:UIControlStateHighlighted];
    [_nvButton setTitleColor:[Utils colorWithHexString:@"#999999"] forState:UIControlStateSelected];
    _nvButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    
    _nvButton.backgroundColor = [UIColor clearColor];
    
    _nvButton.imageEdgeInsets = UIEdgeInsetsMake(5, 100, 0, 5);
    [_nvButton setImage:[UIImage imageNamed:@"navigation_menu_img_p.png"] forState:UIControlStateNormal];
    
    [_nvButton addTarget:self action:@selector(showNavigationMenu:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)showNavigationMenu:(UIButton *)sender
{
    menuShow = !menuShow;
    [_menuPanel showPanel:menuShow];
    [self changeNavImage];
}
-(void)changeNavImage
{
    if (menuShow) {
        [_nvButton setImage:[UIImage imageNamed:@"navigation_menu_img.png"] forState:UIControlStateNormal];
    }else{
        [_nvButton setImage:[UIImage imageNamed:@"navigation_menu_img_p.png"] forState:UIControlStateNormal];
    }
}
-(void)addTabToView
{
    [self.view addSubview:_tab];
}
-(void)addMenuButtonToController:(UIViewController *)controller
{
    [controller.navigationItem setTitleView:_nvButton];
}
- (void)addMenuPanelToController:(UIViewController *)controller
{
    [self.navigation.topViewController.view addSubview:_menuPanel];
    _menuPanel.menuItems = _selectedItems;
    
    int index = [[_menuTag objectForKey:controller.title]intValue];
    _menuPanel.itemClick(_menuPanel.menuItems[index]);
}
- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddeNavigationBar:) name:NOTIFICATION_HIDDE_NAVIGATION object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showNavigationBar:) name:NOTIFICATION_SHOW_NAVIGATION object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddeTabBar:) name:NOTIFICATION_HIDDE_TAB object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabBar:) name:NOTIFICATION_SHOW_TAB object:nil];
}
#pragma mark - 导航控制器代理
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *root = navigationController.viewControllers[0];
    if (viewController != root) {
        
        // 1.添加左边的返回键
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) name:@"back_btn"];
    
    }else{
        [self createNVMenuButton];
        [self addMenuButtonToController:viewController];
        [self addMenuPanelToController:viewController];
        
    }
}
- (void)back
{
    [_navigation popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - oparetion methods
- (void)hiddeNavigationBar:(NSNotification *)notifi
{
    [[UIApplication sharedApplication] setStatusBarStyle:0];
    [UIView animateWithDuration:.2f animations:^{
        CGRect frame = _navigation.view.frame;
        if (isIOS7) {
            frame.origin.y -= 63;
            frame.size.height += 63;
        }else{
            frame.origin.y -= 44;
            frame.size.height += 44;
        }
        _navigation.view.frame = frame;
    }];
}
- (void)showNavigationBar:(NSNotification *)notifi
{
    [[UIApplication sharedApplication] setStatusBarStyle:1];
    [UIView animateWithDuration:.2f animations:^{
        CGRect frame = _navigation.view.frame;
        if (isIOS7) {
            frame.origin.y += 63;
            frame.size.height -= 63;
        }else{
            frame.origin.y += 44;
            frame.size.height -= 44;
        }
        _navigation.view.frame = frame;
    }];
}
- (void)hiddeTabBar:(NSNotification *)notifi
{
    [UIView animateWithDuration:.15f animations:^{
        CGRect frame = _tab.frame;
        frame.origin.y += TopBarHeight;
        _tab.frame = frame;
    }];
}
- (void)showTabBar:(NSNotification *)notifi
{
    [UIView animateWithDuration:.15f animations:^{
        CGRect frame = _tab.frame;
        frame.origin.y -= TopBarHeight;
        _tab.frame = frame;
    }];
}
@end






