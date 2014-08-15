//
//  UUNewViewController.m
//  UUSchool
//
//  Created by 青格勒图 on 14-8-4.
//  Copyright (c) 2014年 青格勒图. All rights reserved.
//

#import "UUNewViewController.h"

@interface UUNewViewController ()

@end

@implementation UUNewViewController

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
    
    [self setBaseCondition];
}
- (void)setBaseCondition
{
    self.title = @"最近";
    self.view.backgroundColor = CENT_COLOR;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
