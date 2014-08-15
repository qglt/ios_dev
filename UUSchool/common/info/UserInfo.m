//
//  UserInfo.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-8.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "UserInfo.h"
#import <JSONKit.h>

@implementation UserInfo

-(id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
    
        self.name = [dict objectForKey:@"name"];
        self.sex = [dict objectForKey:@"sex"];
        self.age = [dict objectForKey:@"age"];
        self.school = [dict objectForKey:@"school"];
        self.schoolArea = [dict objectForKey:@"schoolArea"];
        self.department = [dict objectForKey:@"department"];
        self.grade = [dict objectForKey:@"Grade"];
        self.E_mail = [dict objectForKey:@"E_mail"];
        self.tel = [dict objectForKey:@"tel"];
    }
    return  self;
}
-(id)init
{
    self = [super init];
    
    if (self) {
        
        self.name = @"";
        self.sex = @"";
        self.age = @"";
        self.school = @"";
        self.schoolArea = @"";
        self.department = @"";
        self.grade = @"";
        self.E_mail = @"";
        self.tel = @"";
    }
    return  self;
}
-(NSDictionary *)dictionary
{
    NSDictionary * dict = [NSDictionary dictionaryWithObjects:@[_name,_sex,_age,_school,_schoolArea,_department,_grade,_E_mail,_tel]
                                                      forKeys:@[@"name",@"sex",@"age",@"school",@"schoolArea",@"department",@"grade",@"Email",@"tel"]];
    return dict;
}

@end
