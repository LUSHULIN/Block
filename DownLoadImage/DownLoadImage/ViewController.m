//
//  ViewController.m
//  DownLoadImage
//
//  Created by Jason on 17/11/30.
//  Copyright © 2017年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "DownImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)downAction:(UIButton *)sender {
    NSString *url = @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1725523143,2463382781&fm=27&gp=0.jpg";
    [DownImage downImage:[NSURL URLWithString:url] successBlock:^(id data) {
        UIImage *img = [UIImage imageWithData:data];
        self.imageView.image = img;
    } fail:^(id error) {
        NSLog(@"down error:%@",error);
    }];
    
}

- (IBAction)clearAction:(id)sender {
    self.imageView.image = nil;
}
@end
