//
//  FlipsideViewController.m
//  Bridge Control
//
//  Created by 张光发 on 15/11/3.
//  Copyright © 2015年 张光发. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refreshFields];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:app];
    NSLog(@"FlipsideViewController-viewWillAppear");
}


-(void)refreshFields
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    self.engineSwitch.on=[defaults boolForKey:kWarpDriveKey];
    self.warpFactorSlider.value=[defaults floatForKey:kWarpFactorKey];
}

-(IBAction)engineSwitchTapped
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setBool:self.engineSwitch forKey:kWarpDriveKey];
}

-(IBAction)warpSliderTouched
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.warpFactorSlider.value forKey:kWarpFactorKey];
}
- (IBAction)done:(id)sender {
    [self.delegate flipsideViewControllerDidFinish:self];
}

#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

- (void)applicationWillEnterForeground:(NSNotification *)notification {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}

@end
