//
//  MainViewController.h
//  Bridge Control
//
//  Created by 张光发 on 15/11/4.
//  Copyright © 2015年 张光发. All rights reserved.
//

#import "FlipsideViewController.h"

#define kOfficerKey                    @"officer"
#define kAuthorizationCodeKey          @"authorizationCode"
#define kRankKey                       @"rank"
#define kWarpDriveKey                  @"warp"
#define kWarpFactorKey                 @"warpFactor"
#define kFavoriteTeaKey                @"favoriteTea"
#define kFavoriteCaptainKey            @"favoriteCaptain"
#define kFavoriteGadgetKey             @"favoriteGadget"
#define kFavoriteAlienKey              @"favoriteAlien"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@end
