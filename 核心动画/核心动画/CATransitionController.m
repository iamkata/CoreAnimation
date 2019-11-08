//
//  ViewController.m
//  CATransition
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "CATransitionController.h"

@interface CATransitionController ()

@property(nonatomic,assign) int index;
@property (nonatomic,strong) UIImageView *iconView;

@end

@implementation CATransitionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = 1;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(80, 560, 80, 40);
    leftBtn.backgroundColor = [UIColor orangeColor];
    [leftBtn setTitle:@"上一张" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(200, 560, 80, 40);
    rightBtn.backgroundColor = [UIColor orangeColor];
    [rightBtn setTitle:@"下一张" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 300, 450)];
    [imageV setImage:[UIImage imageNamed:@"1.png"]];
    imageV.backgroundColor = [UIColor yellowColor];
    self.iconView = imageV;
    [self.view addSubview:imageV];
}
- (void)leftBtnClicked {
    self.index--;
    if (self.index<1) {
        self.index=5;
    }
    self.iconView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d.png",self.index]];
    [self addAnimWithLeft:YES];
}

- (void)rightBtnClicked {
//    self.index++;
//    if (self.index>5) {
//        self.index=1;
//    }
//    self.iconView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d.png",self.index]];
//    [self addAnimWithLeft:NO];
    
    [UIView transitionWithView:self.iconView duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        
        //转场 代码
        self.index = self.index + 1;
        if (self.index > 5) {
            self.index = 1;
        }
        
        NSString *imageName = [NSString stringWithFormat:@"%d.png",self.index];
        self.iconView.image = [UIImage imageNamed:imageName];
    } completion:^(BOOL finished) {
    }];
}

- (void)addAnimWithLeft:(BOOL)isleft {
    //创建核心动画
    CATransition *ca = [CATransition animation];
    //告诉要执行什么动画
    //设置过度效果
    ca.type = @"cube";
    //设置动画的过度方向（向左）
    ca.subtype = isleft ? kCATransitionFromLeft : kCATransitionFromRight;
    //设置动画的时间
    ca.duration = 2.0;
    //设置动画的起始位置  比如翻页功能就能设置从哪里开始翻页
    //    ca.startProgress = 0.3;
    //    //设置动画的结束位置
    //    ca.endProgress = 0.5;
    //添加动画
    [self.iconView.layer addAnimation:ca forKey:nil];
}

@end

