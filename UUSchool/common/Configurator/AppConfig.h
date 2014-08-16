//
//  AppCommon.h
//  TTCYMnglLibrary
//
//  Created by admin on 14-6-7.
//  Copyright (c) 2014年 hqglt. All rights reserved.
//

#ifndef TTCYMnglLibrary_AppCommon_h
#define TTCYMnglLibrary_AppCommon_h

//单例对象定义的宏
#define SINGLETON_DEFINE(className) +(className *)shareInstance;

#define SINGLETON_IMPLEMENT(className) \
static className* _instance = nil; \
+ (className *) shareInstance{\
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ _instance = [[self alloc] init];}); return _instance;\
}\
+ (id)allocWithZone:(NSZone *)zone{@synchronized(self) {if (_instance == nil) {_instance = [super allocWithZone:zone];return _instance;}}return nil;} \
- (id)copyWithZone:(NSZone *)zone{return self;}
/**
 *
 *   屏幕适配宏
 */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define kMainScreenFrame [[UIScreen mainScreen] bounds]
#define kMainScreenWidth kMainScreenFrame.size.width
#define kMainScreenHeight kMainScreenFrame.size.height - 20
#define kApplicationFrame [[UIScreen mainScreen] applicationFrame]


#define isIOS7 [[UIDevice currentDevice].systemVersion floatValue]>6.9?YES:NO
#define is4Inch kMainScreenFrame.size.height>480?YES:NO

static CGFloat topDistance = 0;

#define getTopDistance() { \
    if(isIOS7) topDistance = 20;\
          else topDistance = 0;\
}
#define TopBarHeight 49

#define NVC_COLOR   [Utils colorWithHexString:@"#00cccc"]

#define NVC_COLOR_CLEAR [UIColor colorWithWhite:1 alpha:.2]

#define CENT_COLOR [Utils colorWithHexString:@"#fefefe"]

#define BASE_CONTENT_COLOR [Utils colorWithHexString:@"#dddddd"]

//----------------------------------------------------------------------------------------------------------------------------------------
#define TAB_ITEMS @[\
                    [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"成长" vcClass:@"StudyMainViewController" andTag:10000],\
                    [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"生活" vcClass:@"LifeMainViewController" andTag:10001],\
                    [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"动态" vcClass:@"SchoolMainViewController" andTag:10002],\
                    [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"我" vcClass:@"MineMainViewController" andTag:10003]\
                  ]

//----------------------------------------------------------------------------------------------------------------------------------------
#define MENU_STUDY_ITEMS @[\
                           [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"资源分享" vcClass:@"" andTag:20000],\
                           [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"课程表" vcClass:@"" andTag:20001],\
                           [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"日程表" vcClass:@"" andTag:20002],\
                           [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"开发者" vcClass:@"" andTag:20003]\
                          ]
//----------------------------------------------------------------------------------------------------------------------------------------

#define MENU_SCHOOL_ITEMS @[\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"校友圈" vcClass:@"" andTag:20000],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"二手市场" vcClass:@"" andTag:20001],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"找学妹" vcClass:@"" andTag:20002],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"热门活动" vcClass:@"" andTag:20003]\
                           ]
//----------------------------------------------------------------------------------------------------------------------------------------

#define MENU_LIFE_ITEMS @[\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"叫外卖" vcClass:@"TakeawayView" andTag:20000],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"找兼职" vcClass:@"FeatchWorkView" andTag:20001],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"带家教" vcClass:@"TeachView" andTag:20002],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"精品购物" vcClass:@"ShopView" andTag:20003],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"优惠券" vcClass:@"CoupenView" andTag:20004]\
                        ]
//----------------------------------------------------------------------------------------------------------------------------------------

#define MENU_MINE_ITEMS @[\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"我参与的" vcClass:@"" andTag:20000],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"我的收藏" vcClass:@"" andTag:20001],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"我的订单" vcClass:@"" andTag:20002],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"购物车" vcClass:@"" andTag:20003],\
                            [MenuItem itemWithIcon:@"" hightLightIcon:@"" title:@"设置" vcClass:@"" andTag:20004]\
                        ]
//----------------------------------------------------------------------------------------------------------------------------------------

#define NOTIFICATION_HIDDE_NAVIGATION @"hideNavigationBar"
#define NOTIFICATION_SHOW_NAVIGATION  @"showNavigationBar"

#define NOTIFICATION_HIDDE_TAB @"hiddeTabBar"
#define NOTIFICATION_SHOW_TAB  @"showTabBar"




#endif
