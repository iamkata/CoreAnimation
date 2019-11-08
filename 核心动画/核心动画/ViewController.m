//
//  ViewController.m
//  核心动画
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "ViewController.h"
#import "BasicAnimationController.h"
#import "KeyframeAnimationController.h"
#import "AnimationGroupController.h"
#import "CATransitionController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"核心动画";
    
    UIButton *oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    oneBtn.frame = CGRectMake(120, 200, 200, 50);
    oneBtn.backgroundColor = [UIColor orangeColor];
    [oneBtn setTitle:@"CABasicAnimation" forState:UIControlStateNormal];
    [oneBtn addTarget:self action:@selector(oneBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:oneBtn];
    
    UIButton *twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    twoBtn.frame = CGRectMake(120, 300, 200, 50);
    twoBtn.backgroundColor = [UIColor orangeColor];
    [twoBtn setTitle:@"CAKeyframeAnimation" forState:UIControlStateNormal];
    [twoBtn addTarget:self action:@selector(twoBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twoBtn];
    
    UIButton *threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    threeBtn.frame = CGRectMake(120, 400, 200, 50);
    threeBtn.backgroundColor = [UIColor orangeColor];
    [threeBtn setTitle:@"CAAnimationGroup" forState:UIControlStateNormal];
    [threeBtn addTarget:self action:@selector(threeBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:threeBtn];
    
    UIButton *fourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    fourBtn.frame = CGRectMake(120, 500, 200, 50);
    fourBtn.backgroundColor = [UIColor orangeColor];
    [fourBtn setTitle:@"CATransition" forState:UIControlStateNormal];
    [fourBtn addTarget:self action:@selector(fourBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fourBtn];
}

- (void)oneBtnClicked {
    BasicAnimationController *vc = [[BasicAnimationController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)twoBtnClicked {
    KeyframeAnimationController *vc = [[KeyframeAnimationController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)threeBtnClicked {
    AnimationGroupController *vc = [[AnimationGroupController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)fourBtnClicked {
    CATransitionController*vc = [[CATransitionController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
