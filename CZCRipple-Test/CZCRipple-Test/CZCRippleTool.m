//
//  CZCRippleTool.m
//  ImitationTaoBao
//
//  Created by 陈志超 on 2017/2/16.
//  Copyright © 2017年 秦传龙. All rights reserved.
//

#import "CZCRippleTool.h"
@interface CZCRippleTool()

@property (nonatomic, weak)UIView *originView;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) CAShapeLayer *rippleShapeLayer;
@property (nonatomic, strong) CAShapeLayer *rippleShapeLayer1;

@end
@implementation CZCRippleTool
- (instancetype)initWithOriginView:(UIView *)originView{
    if (self = [super init]) {
        
        self.originView = originView;
        self.cycleNumber = 1.5;
        self.speed = 0.05;
        self.fillColor = [UIColor orangeColor];
        self.arcHeight = 50;
        self.rippleAmplitude = 4;
        [self addRipple];
    }
    return self;
}
+ (instancetype)rippleToolWithOriginView:(UIView *)originView{
    return [[[self class] alloc] initWithOriginView:originView];
}
- (void)start{
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(disPlayLink:)];
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}
- (void)disPlayLink:(CADisplayLink *)displayLink {
    CGFloat width = self.originView.frame.size.width;
    self.speed += 0.05;
    self.rippleShapeLayer.path = [self getWavePath:self.rippleAmplitude W:self.cycleNumber * 2*M_PI/width h:20+self.offsetY xOffset:0].CGPath;
    self.rippleShapeLayer1.path = [self getWavePath:self.rippleAmplitude W:self.cycleNumber * 2*M_PI/width h:20+self.offsetY xOffset:10].CGPath;
}

- (void)addRipple{
    
    CAShapeLayer *arcLayer = [CAShapeLayer layer];
    arcLayer.fillColor = [UIColor orangeColor].CGColor;
    arcLayer.frame = self.originView.bounds;
    arcLayer.shouldRasterize = YES;
    arcLayer.path = [self getLayerBezierPath].CGPath;
    [self.originView.layer addSublayer:arcLayer];
    
    
    CAShapeLayer *(^getLayerBlock)() = ^{
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.fillColor = [UIColor whiteColor].CGColor;
        layer.frame = self.originView.bounds;
        layer.opacity = 0.3;
        layer.shouldRasterize = YES;
        [self.originView.layer addSublayer:layer];
        return layer;
    };
    self.rippleShapeLayer = getLayerBlock();
    self.rippleShapeLayer1 = getLayerBlock();
}
- (UIBezierPath *)getLayerBezierPath {
    
    CGFloat width = self.originView.frame.size.width;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(0, self.originView.frame.size.height - self.arcHeight)];
    [path addQuadCurveToPoint:CGPointMake(width, self.originView.frame.size.height - self.arcHeight) controlPoint:CGPointMake(width/2, self.originView.frame.size.height - self.arcHeight/2)];
    [path addLineToPoint:CGPointMake(width, 0)];
    [path closePath];
    return path;
}

- (UIBezierPath *)getWavePath:(CGFloat)A W:(CGFloat)w h:(CGFloat)h xOffset:(CGFloat)xOffset{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    
    for (int i = 0; i < [UIScreen mainScreen].bounds.size.width; i++) {
        CGFloat y = A*sinf(w*i + xOffset+self.speed) + h;
        
        [path addLineToPoint:CGPointMake(i, y)];
    }
    
    [path addLineToPoint:CGPointMake([UIScreen mainScreen].bounds.size.width, 0)];
    [path closePath];
    return path;
    
}
@end
