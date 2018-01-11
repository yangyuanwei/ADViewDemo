//
//  AppDelegate.h
//  ADViewDemo
//
//  Created by XU JUNJIE on 15/7/15.
//  Copyright (c) 2015 ISNC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPushAdSever.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong)  MPushAdSever *pushSever;
@end

