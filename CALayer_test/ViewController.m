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
    
//    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
//    [self.view addGestureRecognizer:tap];

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.layer drawInContext:ctx];
    [self.layer animateCircle];
    
}

- (void)move:(UIGestureRecognizer*)tap{
    [self.layer animateCircle];
}



@end
