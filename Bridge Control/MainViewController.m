//
//  MainViewController.m
//  Bridge Control
//
//  Created by 张光发 on 15/11/3.
//  Copyright © 2015年 张光发. All rights reserved.
//

#import "MainViewController.h"

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self refreshFields];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self refreshFields];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIApplication *app=[UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
     NSLog(@"MainViewController-viewWillAppear");
}

-(void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self refreshFields];
}

-(void)refreshFields
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    self.officerLabel.text=[defaults objectForKey:kOfficerKey];
    self.authorizationCodeLabel.text=[defaults objectForKey:kAuthorizationCodeKey];
    self.rankLabel.text=[defaults objectForKey:kRankKey];
    self.warpDriveLabel.text=[defaults boolForKey:kWarpDriveKey ]?@"Engaged":@"Disabled";
    self.warpFactorLabel.text = [[defaults objectForKey:kWarpFactorKey]
                                stringValue];
    self.favoriteTeaLabel.text = [defaults objectForKey:kFavoriteTeaKey];
    self.favoriteCaptainLabel.text = [defaults objectForKey:kFavoriteCaptainKey];
    self.favoriteGadgetLabel.text = [defaults objectForKey:kFavoriteGadgetKey];
    self.favoriteAlienLabel.text = [defaults objectForKey:kFavoriteAlienKey];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[segue destinationViewController] setDelegate:self];
}

- (void)applicationWillEnterForeground:(NSNotification *)notification {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}

@end
