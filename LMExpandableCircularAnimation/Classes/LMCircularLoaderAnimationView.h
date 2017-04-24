//
//  LMCircularLoaderAnimationView.h
//  Pods
//
//  Created by Lakhpat Meena on 3/10/17.
//
//

#import <UIKit/UIKit.h>

@interface LMCircularLoaderAnimationView : UIView {
    
}

@property (readwrite, nonatomic, strong) UIColor *initialColor;
@property (readwrite, nonatomic, strong) UIColor *endColor;
@property (readwrite, nonatomic, assign) CGFloat initialRadius;
@property (readwrite, nonatomic, assign) CGFloat endRadius;
@property (readwrite, nonatomic, assign) CGFloat initialLineWidth;
@property (readwrite, nonatomic, assign) CGFloat endLineWidth;
@property (readwrite, nonatomic, assign) CFTimeInterval animationDuration;

- (instancetype)initWithFrame:(CGRect)frame initialColor:(UIColor *)initialColor endColor:(UIColor *)endColor initialRadius:(CGFloat)initialRadius endRadius:(CGFloat)endRadius initialLineWidth:(CGFloat)initialWidth endLineWidth:(CGFloat)endWidth andAnimationDuration:(CFTimeInterval)animationDuration;

- (void)startAnimation;

@end
