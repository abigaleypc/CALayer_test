//
//  CircleLayer.m
//  CALayer_test
//
//  Created by Yu Abigale on 2020/6/5.
//  Copyright © 2020 Yu Abigale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleLayer.h"

@interface CircleLayer()
@property (nonatomic, assign) CGFloat progress;
@end

@implementation CircleLayer


+ (BOOL)needsDisplayForKey:(NSString *)key {
    BOOL result;
    if ([key isEqualToString:@"progress"]) {
        result = YES;
    } else{
        result = [super needsDisplayForKey:key];
    }
    return result;
}

- (void)animateCircle {
   CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"progress"];
        anim.values = [self valuesListWithAnimationDuration: 3];
        anim.duration = 3.0;
        anim.fillMode = kCAFillModeForwards;
        anim.removedOnCompletion = NO;
        anim.delegate = self;
        [self addAnimation:anim forKey:@"circle"];
}


- (NSMutableArray *)valuesListWithAnimationDuration:(CGFloat)duration {
    NSInteger numberOfFrames = duration * 60;
    NSMutableArray *values = [NSMutableArray array];
    // 注意这里的 fromValue和toValue是针对的progress的值的大小。
    CGFloat fromValue = 0.0;
    CGFloat toValue = 1.0;
    CGFloat diff = toValue - fromValue;
    for (NSInteger frame = 1; frame <= numberOfFrames; frame++) {
        CGFloat piece = (CGFloat)frame / (CGFloat)numberOfFrames;
        CGFloat currentValue = fromValue + diff * piece;
        [values addObject:@(currentValue)];
    }
    return values;
}

- (void)drawInContext:(CGContextRef)ctx {
    NSLog(@"=======progress: %f", self.progress);
    CGContextSetLineWidth(ctx, 5.0f);
    CGContextSetLineWidth(ctx, 5.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextAddArc(ctx, CGRectGetWidth(self.bounds) * 0.5, CGRectGetHeight(self.bounds) * 0.5, CGRectGetWidth(self.bounds) * 0.5 - 6, 0, 2 * M_PI * self.progress, 0);
    CGContextStrokePath(ctx);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self removeAnimationForKey:@"circle"];
    self.progress = 1.0;
    [self setNeedsDisplay];
}
@end

