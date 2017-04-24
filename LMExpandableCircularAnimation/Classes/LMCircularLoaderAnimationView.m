//
//  LMCircularLoaderAnimationView.m
//  Pods
//
//  Created by Lakhpat Meena on 3/10/17.
//
//

#import "LMCircularLoaderAnimationView.h"

@interface LMCircularLoaderAnimationView () {
    
    UIBezierPath *_startShape, *_endShape;
    CAShapeLayer *_circleShape1, *_circleShape2;
    BOOL _circleShape1Animating, _circleShape2Animating;
    NSTimer *_loaderTimer;
    CABasicAnimation *_pathAnimation, *_strokeColorAnimation, *_lineWidthAnimation;
    CAAnimationGroup *_animationsGroup;
    UIImageView *_towerImageView;
    
}

@end

@implementation LMCircularLoaderAnimationView

- (instancetype)initWithFrame:(CGRect)frame initialColor:(UIColor *)initialColor endColor:(UIColor *)endColor initialRadius:(CGFloat)initialRadius endRadius:(CGFloat)endRadius initialLineWidth:(CGFloat)initialWidth endLineWidth:(CGFloat)endWidth andAnimationDuration:(CFTimeInterval)animationDuration
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _initialColor = initialColor;
        _endColor = endColor;
        _initialRadius = initialRadius;
        _endRadius = endRadius;
        _initialLineWidth = initialWidth;
        _endLineWidth = endWidth;
        _animationDuration = animationDuration;
    }
    
    return self;
}

- (void)startAnimation
{
    //[self createLoaderTowerImageView];
    [self initializeLoaderAnimationItems];
    [self startLoaderAnimationTimer];
}

#pragma mark - Private helper methods

- (void)initializeLoaderAnimationItems
{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    if (!_endRadius)
    {
        _endRadius = (MIN(bounds.size.width, bounds.size.height)/2.0) - 5.0;
    }
    
    if (!_initialRadius)
    {
        _initialRadius = _endRadius / 5;
    }
    
    // (lp) Initial path
    if (!_startShape)
    {
        _startShape = [UIBezierPath bezierPathWithArcCenter:center radius:_initialRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    }
    
    // (lp) Final path
    if (!_endShape)
    {
        _endShape = [UIBezierPath bezierPathWithArcCenter:center radius:_endRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    }
    
    // (lp) Path animation
    if (!_pathAnimation)
    {
        _pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        _pathAnimation.toValue = (id)_endShape.CGPath;
        _pathAnimation.fromValue = (id)_startShape.CGPath;
        _pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    }
    
    // (lp) Stroke color animation
    if (!_strokeColorAnimation)
    {
        if (!_initialColor)
        {
            _initialColor = [UIColor cyanColor];
        }
        if (!_endColor)
        {
            _endColor = _initialColor;
        }
        
        _strokeColorAnimation = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
        _strokeColorAnimation.toValue = (id)_endColor.CGColor;
        _strokeColorAnimation.fromValue = (id)_initialColor.CGColor;
        _strokeColorAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    }
    
    
    // (lp) Line width animation
    if (!_lineWidthAnimation)
    {
        if (!_initialLineWidth)
        {
            _initialLineWidth = 15;
        }
        if (!_endLineWidth)
        {
            _endLineWidth = 12;
        }
        
        _lineWidthAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
        _lineWidthAnimation.toValue = (id)[NSNumber numberWithFloat:_endLineWidth];
        _lineWidthAnimation.fromValue = (id)[NSNumber numberWithFloat:_initialLineWidth];
        _lineWidthAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    }
    
    // (lp) Animation group
    if (!_animationsGroup)
    {
        if (!_animationDuration)
        {
            _animationDuration = 1.55f;
        }
        
        _animationsGroup = [CAAnimationGroup animation];
        _animationsGroup.animations = [NSArray arrayWithObjects:_pathAnimation, _strokeColorAnimation, _lineWidthAnimation, nil];
        _animationsGroup.removedOnCompletion = NO;
        _animationsGroup.duration = _animationDuration;
        _animationsGroup.fillMode  = kCAFillModeForwards;
    }
    
    // (lp) Need two CAShapeLayer to achieve the better animation.
    // (lp) Circle shape layer 1
    if (!_circleShape1)
    {
        _circleShape1 = [CAShapeLayer layer];
        _circleShape1.fillColor = nil;
        _circleShape1.bounds = bounds;
        _circleShape1.position = center;
        
        [self.layer addSublayer:_circleShape1];
    }
    
    // (lp) Circle shape layer 2
    if (!_circleShape2)
    {
        _circleShape2 = [CAShapeLayer layer];
        _circleShape2.fillColor = nil;
        _circleShape2.bounds = bounds;
        _circleShape2.position = center;
        
        [self.layer addSublayer:_circleShape2];
    }
}

- (void)createLoaderTowerImageView
{
    if (!_towerImageView)
    {
        _towerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Oval"]];
        _towerImageView.center = self.center;
        [self addSubview:_towerImageView];
    }
}

- (void)startLoaderAnimationTimer
{
    if (!_loaderTimer)
    {
        _loaderTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeTheCircle:) userInfo:nil repeats:YES];
    }
    [_loaderTimer fire];
}

- (void)changeTheCircle:(id)sender
{
    if (!_circleShape1Animating)
    {
        [_circleShape1 removeAnimationForKey:@"expand"];
        [_circleShape1 addAnimation:_animationsGroup forKey:@"expand"];
        _circleShape1Animating = YES;
        _circleShape2Animating = NO;
    }
    else if (!_circleShape2Animating)
    {
        [_circleShape2 removeAnimationForKey:@"expend"];
        [_circleShape2 addAnimation:_animationsGroup forKey:@"expend"];
        _circleShape2Animating = YES;
        _circleShape1Animating = NO;
    }
    
}


@end
