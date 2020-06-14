//
//  ViewController.m
//  CALayer_test
//
//  Created by Yu Abigale on 2020/6/5.
//  Copyright © 2020 Yu Abigale. All rights reserved.
//

#import "ViewController.h"
#import "CircleLayer.h"

@interface ViewController ()
@property (nonatomic, strong) CircleLayer *layer;
@property (nonatomic, strong) CALayer *tempLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"---viewDidLoad----");
    // Do any additional setup after loading the view.
    self.layer = [[CircleLayer alloc]init];
    self.layer.frame = CGRectMake(50, 100, 100, 100);
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.layer];
    
    self.tempLayer = [CALayer layer];
    self.tempLayer.frame = CGRectMake(50, 400, 100, 100);
    self.tempLayer.backgroundColor = [UIColor magentaColor].CGColor;
    
    [self.view.layer addSublayer:self.tempLayer];
    [self startAnimation];
    
//    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
//    [self.view addGestureRecognizer:tap];

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.layer drawInContext:ctx];
    [self.layer animateCircle];
    
    
    
}

-(void)startAnimation {
    CAKeyframeAnimation *kfanim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    CGMutablePathRef ref = CGPathCreateMutable();
    kfanim.values = @[[NSValue valueWithCGPoint:CGPointMake(150, 150)], [NSValue valueWithCGPoint:CGPointMake(10, 150)], [NSValue valueWithCGPoint:CGPointMake(10, 250)]];
    kfanim.duration = 4.0;
//    kfanim.keyTimes= @[@(0.4),@(0.3),@(0.3)];
    
    kfanim.repeatCount = HUGE_VALF;
    [self.tempLayer addAnimation:kfanim forKey:nil];
    
//    kfanim.
}

- (void)move:(UIGestureRecognizer*)tap{
    [self.layer animateCircle];
}



@end
