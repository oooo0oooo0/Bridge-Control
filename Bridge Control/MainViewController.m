//
//  MainViewController.m
//  Bridge Control
//
//  Created by 张光发 on 15/11/4.
//  Copyright © 2015年 张光发. All rights reserved.
//

#import "MainViewController.h"
#import "FlipsideViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *officerLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorizationCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UILabel *warpDriveLabel;
@property (weak, nonatomic) IBOutlet UILabel *warpFactorLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteTeaLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCaptainLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteGadgetLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteAlienLabel;
@end

@implementation MainViewController

//刷新界面
- (void)refreshFields {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.officerLabel.text = [defaults objectForKey:kOfficerKey];
    self.authorizationCodeLabel.text = [defaults
                                        objectForKey:kAuthorizationCodeKey];
    self.rankLabel.text = [defaults objectForKey:kRankKey];
    self.warpDriveLabel.text = [defaults boolForKey:kWarpDriveKey]
    ? @"Engaged" : @"Disabled";
    self.warpFactorLabel.text = [[defaults objectForKey:kWarpFactorKey]
                                 stringValue];
    self.favoriteTeaLabel.text = [defaults objectForKey:kFavoriteTeaKey];
    self.favoriteCaptainLabel.text = [defaults objectForKey:kFavoriteCaptainKey];
    self.favoriteGadgetLabel.text = [defaults objectForKey:kFavoriteGadgetKey];
    self.favoriteAlienLabel.text = [defaults objectForKey:kFavoriteAlienKey];
}

//界面加载完毕后调用
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self refreshFields];
    NSLog(@"MainViewController--viewDidAppear");
}

//界面第一次加载完成后调用
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"MainViewController--viewDidLoad");
}

//翻转结束后的回调方法
-(void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"翻转结束");
}

//界面加载好之前调用
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //当前控制器订阅UIApplicationWillEnterForegroundNotification(应用从后台变为前台应用)通知
    UIApplication *app=[UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
    NSLog(@"MainViewController--viewWillAppear");
}

// 界面成为前台时的回调方法
-(void)willEnterForeground:(NSNotification *)notification
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}

#pragma mark - Navigation

// 转场之前设置委托
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    FlipsideViewController *fsVC=[segue destinationViewController];
    fsVC.delegate=self;
}

@end
