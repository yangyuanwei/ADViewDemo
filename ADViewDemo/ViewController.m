//
//  ViewController.m
//  ADViewDemo
//
//  Created by XU JUNJIE on 15/7/15.
//  Copyright (c) 2015 ISNC. All rights reserved.
//

#import "ViewController.h"
#import "MInterstital.h"
#import "MLaunchFullView.h"
#import "MLaunchFullScreen.h"
#import "MPushAdSever.h"
#import "AppDelegate.h"
#import "MTestViewController.h"
@interface ViewController ()<MInterstitalDelegate>
@property (nonatomic, strong) MInterstital *mIterstital;
//@property (nonatomic, strong)  MPushAdSever *pushSever;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"M信";
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageV.image = [UIImage imageNamed:@"WechatIMG157.jpeg"];
    [self.view addSubview:imageV];

    
#pragma mark ====================================广告位id=======================================
    /**  广告位id = appId + （开屏/插屏广告）
     */
 
    NSString *advertisingid_1 = [NSString stringWithFormat:@"%@开屏广告",APPID];
    NSString *advertisingid_2 = [NSString stringWithFormat:@"%@插屏广告",APPID];
    
    
#pragma mark ====================================启动页广告=======================================
/*
    //初始化开屏广告位
    MLaunchFullScreen *fullView = [[MLaunchFullScreen alloc] initWithAppID:APPID AdvertisingID:advertisingid_1];
    
    //设置广告位的位置
    [fullView setAdFrame:CGRectMake(0, 0, self.view.bounds.size.width , self.view.bounds.size.height - 150) ButtonTitle:@"跳过" TimerIntValue:6];
    __block typeof(fullView) blockFullView = fullView ;
    fullView.isOkShowAdBlock = ^{
        //将广告位在当前 控制器中显示
        [blockFullView showFromViewController:self];
    };
    fullView.closeAdBlock = ^{
        //退出
        NSLog(@"退出");
//        MTestViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MTestViewController"];
//                                   [self presentViewController:vc animated:YES completion:nil];
    };
*/

    
  
    
    

#pragma mark ====================================插屏广告=======================================

    
    //插屏广告
    MInterstital *mIterstital = [[MInterstital alloc] initWithAppID:APPID AdvertisingID:advertisingid_2];
    self.mIterstital = mIterstital;
    mIterstital.delegate = self;
   
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //登录成功后， 绑定用户账号
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];

    [delegate.pushSever bindUser:@"123456" Tag:APPID];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    NSLog(@"点击了屏幕哈哈哈哈：%@",
//          [UIApplication sharedApplication].keyWindow);
//    //登录成功后， 绑定用户账号
//    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
//
//       [delegate.pushSever bindUser:@"123456" Tag:APPID];
//     NSString *advertisingid = [NSString stringWithFormat:@"%@开屏广告",APPID ];
//    NSDictionary *dict = @{
//                           @"adId":advertisingid,
//                           @"appId":APPID,
//                           @"deviceId":[[UIDevice currentDevice].identifierForVendor UUIDString]
//                           };
//
//    AFHTTPSessionManager *mng = [AFHTTPSessionManager manager];
//    mng.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html",nil];
//    [mng.requestSerializer setValue:@"text/html; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    mng.requestSerializer= [AFHTTPRequestSerializer serializer];
//    mng.responseSerializer= [AFJSONResponseSerializer serializer]; //请求用json 格式
//    mng.requestSerializer = [AFJSONRequestSerializer serializer];
//
//    [mng.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [mng POST:ClickHost parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"点击了广告");
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"点击广告失败");
//
//    }];
}

#pragma mark - MInterstitalDelegate
- (void)interstitialDidReceiveAd:(MInterstital *)interstitial{
    //收到推送展示插屏广告
    [self.mIterstital showFromViewController:self];
}


@end
