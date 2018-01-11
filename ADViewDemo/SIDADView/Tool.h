//
//  Tool.h
//  ADViewDemo
//
//  Created by 杨远威 on 2017/12/26.
//  Copyright © 2017年 ISNC. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kUserDefaults [NSUserDefaults standardUserDefaults]

@interface Tool : NSObject
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  设置启动页广告
 */
+ (void)setupAdvertWithImageStr;

/**
 *  判断文件是否存在
 */
+(BOOL)isFileExistWithFilePath:(NSString *)filePath;

/**
 *  初始化广告页面
 */
+ (void)getAdvertisingImage :(NSString *)imageUrl;

/**
 *  下载新图片
 */
+ (void)downloadAdImageWithUrl:(NSString *)imageUrl imageName:(NSString *)imageName;

/**
 *  删除旧图片
 */
+ (void)deleteOldImage;

/**
 *  根据图片名拼接文件路径
 */
+ (NSString *)getFilePathWithImageName:(NSString *)imageName;
@end
