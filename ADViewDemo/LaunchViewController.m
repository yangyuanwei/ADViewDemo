//
//  LaunchViewController.m
//  TestMAd
//
//  Created by 杨远威 on 2018/1/2.
//  Copyright © 2018年 杨远威. All rights reserved.
//

#import "LaunchViewController.h"
#import "ViewController.h"
#import "MLaunchFullScreen.h"
@interface LaunchViewController ()

@property(weak,nonatomic) UIImageView *imageV;
@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
#pragma mark ====================================启动页广告=======================================
    NSString *advertisingid = [NSString stringWithFormat:@"%@开屏广告",APPID ];
    
    //0、初始化开屏广告位
    MLaunchFullScreen *fullView = [[MLaunchFullScreen alloc] initWithAppID:APPID AdvertisingID:advertisingid];
    
    //1、设置广告位的位置大小
    [fullView setAdFrame:CGRectMake(0, 0, self.view.bounds.size.width , self.view.bounds.size.height - 95) ButtonTitle:@"跳过" TimerIntValue:3];
    __block typeof(fullView) blockFullView = fullView ;
    fullView.isOkShowAdBlock = ^{
        //2、将广告位在当前 控制器中显示
        [blockFullView showFromViewController:self];
    };
//    [blockFullView showFromViewController:self];
    fullView.closeAdBlock = ^{
        //3、退出
//        [self.imageV removeFromSuperview];
        NSLog(@"退出");
        ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
       
    };

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageV = imageV;
    [self.view addSubview:imageV];
    imageV.image = [UIImage imageNamed:@"tingshu"];
    NSLog(@"viewDidLoad: 启动页本地图片");
}


@end
