//
//  DownImage.m
//  DownLoadImage
//
//  Created by Jason on 17/11/30.
//  Copyright © 2017年 Jason. All rights reserved.
//

#import "DownImage.h"

@implementation DownImage

+ (void)downImage:(NSURL *)url successBlock:(successDown)successBlock fail:(failDown)failBlick {
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
        // 剪切文件
        [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:path] error:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        if (error != nil) {
            failBlick(error);
        }else {
            successBlock(data);
        }
        
    }];
    [task resume];

}
@end
