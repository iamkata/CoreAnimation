//
//  ViewController.m
//  CAKeyframeAnimation
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "KeyframeAnimationController.h"

#define angle2Radian(angle) ((angle) / 180.0 * M_PI)

@interface KeyframeAnimationController () <CAAnimationDelegate>

@property (weak, nonatomic) UIView *customView;

@end

@implementation KeyframeAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor orangeColor];
    self.customView = view;
    [self.view addSubview:view];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self methodOne];
    //[self methodTwo];
    [self doudong];
}

- (void)doudong {
    //1.创建核心动画
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    keyAnima.keyPath=@"transform.rotation";
    //设置动画时间
    keyAnima.duration=0.1;
    //设置图标抖动弧度
    //把度数转换为弧度  度数/180*M_PI
    keyAnima.values=@[@(-angle2Radian(4)),@(angle2Radian(4)),@(-angle2Radian(4))];
    //设置动画的重复次数(设置为最大值)
    keyAnima.repeatCount=MAXFLOAT;
    keyAnima.fillMode=kCAFillModeForwards;
    keyAnima.removedOnCompletion=NO;
    //2.添加动画
    [self.customView.layer addAnimation:keyAnima forKey:nil];
}

- (void)methodTwo {
    //1.创建动画对象
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.duration = 2;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(300, 50)];
    [path addLineToPoint:CGPointMake(300, 400)];
    
    anim.keyPath =  @"position";
    anim.path = path.CGPath;
    
    //设置代理，开始—结束
    anim.delegate=self;
    self.customView.layer.anchorPoint = CGPointZero;
    [self.customView.layer addAnimation:anim forKey:nil];
}

- (void)methodOne {
    //1.创建核心动画
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    //平移
    keyAnima.keyPath=@"position";
    //1.1告诉系统要执行什么动画
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    keyAnima.values=@[value1,value2,value3,value4,value5];
    //1.2设置动画执行完毕后，不删除动画
    keyAnima.removedOnCompletion=NO;
    //1.3设置保存动画的最新状态
    keyAnima.fillMode=kCAFillModeForwards;
    //1.4设置动画执行的时间
    keyAnima.duration=4.0;
    //1.5设置动画的节奏
    keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //设置代理，开始—结束
    keyAnima.delegate=self;
    //2.添加核心动画
    [self.customView.layer addAnimation:keyAnima forKey:nil];
}

#pragma mark - CAAnimationDelegate

-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"开始动画");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"结束动画");
}

@end
