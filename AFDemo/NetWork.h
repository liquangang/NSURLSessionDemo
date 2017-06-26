//
//  NetWork.h
//  AFDemo
//
//  Created by quangang on 2017/6/26.
//  Copyright © 2017年 LQG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWork : NSObject

/**
 *  get模拟
 */
+ (void)getRequestWithURL:(NSURL *)URL completionHandler:(void(^)(NSString *data, NSURLResponse *response, NSError *error))completionHandler;

/**
 *  push模拟
 */
+ (void)pushRequestWithURL:(NSURL *)URL postBody:(NSString *)postBody completionHandler:(void(^)(NSString *data, NSURLResponse *response, NSError *error))completionHandler;

@end
