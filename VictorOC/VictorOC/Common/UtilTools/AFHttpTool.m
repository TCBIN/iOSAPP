//
//  UploadFilesTool.m
//  VictorOC
//
//  Created by WebUser on 17/2/28.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "AFHttpTool.h"

@implementation AFHttpTool

// GET请求
+ (void)getWithURLString:(NSString *)spliceUrl
              parameters:(id)parameters
             resultClass:(Class)resultClass
                 success:(Success_Block)success
                 failure:(Failure_Block)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseURL,spliceUrl];
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"\n 请求url %@\n 参数 %@\n 结果 %@\n",url,parameters,responseObject);
        id keyValues = [responseObject mj_JSONObject];
        if (resultClass!=nil) {
            id resultObject = [resultClass mj_objectWithKeyValues:keyValues];
            if (success) {
                success(resultObject);
            }
        }else{
            if (success) {
                success(responseObject);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"\n 请求url %@\n 参数 %@\n failure %@\n",url,parameters,error);
            failure(error);
        }
    }];
}


// POST请求
+ (void)postWithURLString:(NSString *)spliceUrl
               parameters:(id)parameters
              resultClass:(Class)resultClass
                  success:(Success_Block)success
                  failure:(Failure_Block)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseURL,spliceUrl];
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"\n 请求url %@\n 参数 %@\n 结果 %@\n",url,parameters,responseObject);
        id keyValues = [responseObject mj_JSONObject];
        if (resultClass!=nil) {
            id resultObject = [resultClass mj_objectWithKeyValues:keyValues];
            if (success) {
                success(resultObject);
            }
        }else{
            if (success) {
                success(responseObject);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"\n 请求url %@\n 参数 %@\n failure %@\n",url,parameters,error);
            failure(error);
        }
    }];
}


#pragma mark -- 上传单张图片 --
+ (void)uploadImageWithURLString:(NSString *)spliceUrl
                      parameters:(id)parameters
                      uploadData:(NSData *)uploadData
                      uploadName:(NSString *)uploadName
                     resultClass:(Class)resultClass
                        progress:(Progress_Block)progress
                         success:(Success_Block)success
                         failure:(Failure_Block)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseURL,spliceUrl];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id< AFMultipartFormData >  _Nonnull formData) {
        [formData appendPartWithFileData:uploadData name:uploadName fileName:[NSString stringWithFormat:@"%@.png",uploadName] mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"\n 请求url %@\n 参数 %@\n 结果 %@\n",url,parameters,responseObject);
        id keyValues = [responseObject mj_JSONObject];
        if (resultClass!=nil) {
            id resultObject = [resultClass mj_objectWithKeyValues:keyValues];
            if (success) {
                success(resultObject);
            }
        }else{
            if (success) {
                success(responseObject);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            NSLog(@"\n 请求url %@\n 参数 %@\n failure %@\n",url,parameters,error);
            failure(error);
        }
    }];
}

#pragma mark -- 上传多张图片 --
+ (void)uploadImagesWithURLString:(NSString *)spliceUrl
                       parameters:(id)parameters
                      uploadDatas:(NSMutableArray *)uploadDatas
                       uploadName:(NSString *)uploadName
                      resultClass:(Class)resultClass
                         progress:(Progress_Block)progress
                          success:(Success_Block)success
                          failure:(Failure_Block)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseURL,spliceUrl];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id< AFMultipartFormData >  _Nonnull formData) {
        for (int i=0; i<uploadDatas.count; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%@[%d]", uploadName, i];
            [formData appendPartWithFileData:uploadDatas[i] name:imageName fileName:[NSString stringWithFormat:@"%@%d.JPEG",uploadName,i] mimeType:@"image/JPEG"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"\n 请求url %@\n 参数 %@\n 结果 %@\n",url,parameters,responseObject);
        id keyValues = [responseObject mj_JSONObject];
        if (resultClass!=nil) {
            id resultObject = [resultClass mj_objectWithKeyValues:keyValues];
            if (success) {
                success(resultObject);
            }
        }else{
            if (success) {
                success(responseObject);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            NSLog(@"\n 请求url %@\n 参数 %@\n failure %@\n",url,parameters,error);
            failure(error);
        }
    }];
}

@end
