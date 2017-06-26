//
//  NetWork.m
//  AFDemo
//
//  Created by quangang on 2017/6/26.
//  Copyright © 2017年 LQG. All rights reserved.
//

#import "NetWork.h"

@implementation NetWork

/**
 *  get模拟
 */
+ (void)getRequestWithURL:(NSURL *)URL completionHandler:(void(^)(NSString *data, NSURLResponse *response, NSError *error))completionHandler{
    
    //获得默认的session对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    //创建task，并设置block
    NSURLSessionTask *task = [session dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@", data);
        
        //转成nsstring
        NSError *conversionError;
        NSString *tempString = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&conversionError];
        
        
        if (error || conversionError) {
            NSLog(@"%@\n%@", error, conversionError);
        }else{
            if (completionHandler) {
                completionHandler(tempString, response, error);
            }
        }
        
    }];
    
    [task resume];
}

/**
 *  push模拟
 */
+ (void)pushRequestWithURL:(NSURL *)URL postBody:(NSString *)postBody completionHandler:(void(^)(NSString *data, NSURLResponse *response, NSError *error))completionHandler{
    
    //创建并初始化request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [postBody dataUsingEncoding:NSUTF8StringEncoding];
    
    //获取默认session
    NSURLSession *session = [NSURLSession sharedSession];
    
    //初始化task
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@", data);
        
        //转成nsstring
        NSError *conversionError;
        NSString *tempString = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&conversionError];
        
        
        if (error || conversionError) {
            NSLog(@"%@\n%@", error, conversionError);
        }else{
            if (completionHandler) {
                completionHandler(tempString, response, error);
            }
        }
    }];
    
    [task resume];
}

@end
