//
//  DownImage.h
//  DownLoadImage
//
//  Created by Jason on 17/11/30.
//  Copyright © 2017年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successDown)(id data);
typedef void(^failDown)(id error);

@interface DownImage : NSObject

+ (void)downImage:(NSURL *)url successBlock:(successDown)successBlock fail:(failDown)failBlick;

@end
