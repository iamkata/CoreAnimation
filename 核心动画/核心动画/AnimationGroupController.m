//
//  ViewController.m
//  CAAnimationGroup
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "AnimationGroupController.h"

@interface AnimationGroupController ()

@property (weak, nonatomic) UIView *customView;

@end

@implementation AnimationGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor orangeColor];
    self.customView = view;
    [self.view addSubview:view];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
     // 平移动画
     CABasicAnimation *a1 = [CABasicAnimation animation];
     a1.keyPath = @"transform.translation.y";
     a1.toValue = @(200);
     // 缩放动画
     CABasicAnimation *a2 = [CABasicAnimation animation];
     a2.keyPath = @"transform.scale";
     a2.toValue = @(0.3);
     // 旋转动画
     CABasicAnimation *a3 = [CABasicAnimation animation];
     a3.keyPath = @"transform.rotation";
     a3.toValue = @(M_PI_2);

     // 组动画
     CAAnimationGroup *groupAnima = [CAAnimationGroup animation];

     groupAnima.animations = @[a1, a2, a3];

     //设置组动画的时间
     groupAnima.duration = 2;
//     groupAnima.fillMode = kCAFillModeForwards;
//     groupAnima.removedOnCompletion = NO;

     [self.customView.layer addAnimation:groupAnima forKey:nil];
}

@end
