//
//  FlipsideViewController.m
//  Bridge Control
//
//  Created by 张光发 on 15/11/4.
//  Copyright © 2015年 张光发. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshFields];
    NSLog(@"FlipsideViewController--viewDidLoad");
}

//界面加载完成之前调用
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //订阅通知
    UIApplication *app=[UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
    
    NSLog(@"FlipsideViewController--viewWillAppear");
}

//收到通知时调用
-(void)willEnterForeground:(NSNotification *)notification
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //同步设置
    [defaults synchronize];
    [self refreshFields];
}

//刷新界面
- (void)refreshFields {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.engineSwitch.on = [defaults boolForKey:kWarpDriveKey];
    self.warpFactorSlider.value = [defaults floatForKey:kWarpFactorKey];
}

- (IBAction)engineSwitchTapped {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.engineSwitch.on forKey:kWarpDriveKey];
    [defaults synchronize];
}

- (IBAction)warpSliderTouched {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.warpFactorSlider.value forKey:kWarpFactorKey];
    [defaults synchronize];
}

- (IBAction)done:(id)sender {
    //调用委托对象的方法
    [self.delegate flipsideViewControllerDidFinish:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
