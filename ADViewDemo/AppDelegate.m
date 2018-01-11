//
//  AppDelegate.m
//  ADViewDemo
//
//  Created by XU JUNJIE on 15/7/15.
//  Copyright (c) 2015 ISNC. All rights reserved.
//

#import "AppDelegate.h"
#import "MInterstital.h"
#import "GSKeyChainDataManager.h"
#import "MPushAdSever.h"
#import "LaunchViewController.h"
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface AppDelegate ()<MInterstitalDelegate>
@property (nonatomic, strong) MInterstital *mIterstital;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
   

    

    /*  MPushAdSever_AD_TYPE_INT = 1,    //插屏广告（主要）
      MPushAdSever_AD_TYPE_OPEN = 2,   //开屏广告（主要）
     */
    
    //0、广告位参数设置
    NSString *advertisingid_1 = [NSString stringWithFormat:@"%@开屏广告",APPID];
    NSString *advertisingid_2 = [NSString stringWithFormat:@"%@插屏广告",APPID];
    NSDictionary *dict = @{
                           @"appId":APPID,
                           @"advertisingbitsVOList":@[
                                   //广告位1
                                   @{
                                   @"advertisingid":advertisingid_1,
                                   @"type":@(2), //开屏广告
                                   @"height":@(SCREEN_HEIGHT),
                                   @"width":@(SCREEN_WIDTH),
                                   @"advertisingName":@"开屏广告"
                                   },
                                   
                                   @{
                                       @"advertisingid":advertisingid_2,
                                       @"type":@(1), //插屏广告
                                       @"height":@(SCREEN_HEIGHT),
                                       @"width":@(SCREEN_WIDTH),
                                        @"advertisingName":@"插屏广告"
                                       }
                                   ]
                        
                           };
    
    //1、初始化推送服务
    MPushAdSever *pushSever = [[MPushAdSever alloc] initWithAdDict:dict];
    self.pushSever = pushSever;
    [pushSever connectPushSever];
    
//    [pushSever bindUser:@"123456"];
    

    //2、 获取UUID
     [self saveUUID];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LaunchViewController *launchVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchViewController"];
    self.window.rootViewController = launchVC;
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 *  保存UDID
 */
- (void)saveUUID{
    NSString *udid = [GSKeyChainDataManager readUUID];
    if (udid == nil) {
        NSString *deviceUUID = [[UIDevice currentDevice].identifierForVendor UUIDString];
        [GSKeyChainDataManager saveUUID:deviceUUID];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - MInterstitalDelegate
//- (void)interstitialDidReceiveAd:(MInterstital *)interstitial{
//    [self.mIterstital showFromOtherWindows];
//}
@end
