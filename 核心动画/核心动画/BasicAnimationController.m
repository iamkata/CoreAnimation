//
//  ViewController.m
//  核心动画
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "BasicAnimationController.h"

@interface BasicAnimationController () <CAAnimationDelegate>

@property(nonatomic,strong)CALayer *myLayer;

@end

@implementation BasicAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建layer
    CALayer *myLayer=[CALayer layer];
    //设置layer的属性
    myLayer.bounds=CGRectMake(0, 0, 150, 60);
    myLayer.backgroundColor=[UIColor yellowColor].CGColor;
    myLayer.position=CGPointMake(100, 100);
    myLayer.anchorPoint=CGPointMake(0, 0);
    myLayer.cornerRadius=40;
    //添加layer
    self.myLayer=myLayer;
    [self.view.layer addSublayer:myLayer];
}

//设置动画
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self pingyi];
    //[self suofang];
    [self xuanzhuan];
}

//平移
- (void)pingyi {
    //1.创建核心动画
    //    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:<#(NSString *)#>]
    CABasicAnimation *anima=[CABasicAnimation animation];
    
    //1.1告诉系统要执行什么样的动画
    anima.keyPath=@"position";
    //设置通过动画，将layer从哪儿移动到哪儿
    anima.fromValue=[NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anima.toValue=[NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    //1.2设置动画执行完毕之后不删除动画
    anima.removedOnCompletion=NO;
    //1.3设置保存动画的最新状态
    anima.fillMode = @"forwards";
    //anim.fillMode = kCAFillModeForwards;
    
    anima.delegate = self;
    NSString *str=NSStringFromCGPoint(self.myLayer.position);
    NSLog(@"执行前：%@",str);
    
    //2.添加核心动画到layer
    [self.myLayer addAnimation:anima forKey:nil];
}

//缩放
- (void)suofang {
    //缩放动画可以实现心跳效果
    //创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    //设置属性值
    anim.keyPath = @"transform.scale";
    anim.toValue = @0;
    
    //设置动画执行次数
    anim.repeatCount = MAXFLOAT;
    
    //设置动画执行时长
    anim.duration = 3;
    
    //自动反转(怎么样去 怎么样回来)
    anim.autoreverses = YES;
    
    //添加动画
    [self.myLayer addAnimation:anim forKey:nil];
}

//旋转
- (void)xuanzhuan {
    //1.创建动画
    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:@"transform"];
    //1.1设置动画执行时间
    anima.duration=2.0;
    //1.2修改属性，执行动画
    anima.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2+M_PI_4, 1, 1, 0)];
    //1.3设置动画执行完毕后不删除动画
    anima.removedOnCompletion=NO;
    //1.4设置保存动画的最新状态
    anima.fillMode=kCAFillModeForwards;
    
    //2.添加动画到layer
    [self.myLayer addAnimation:anima forKey:nil];
}

#pragma mark - CAAnimationDelegate代理

-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"开始执行动画");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //动画执行完毕，打印执行完毕后的position值
    NSString *str=NSStringFromCGPoint(self.myLayer.position);
    NSLog(@"执行后：%@",str);
}

@end
