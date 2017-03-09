//
//  LMViewController.m
//  LMExpandableCircularAnimation
//
//  Created by Lakhpat Meena on 03/09/2017.
//  Copyright (c) 2017 Lakhpat Meena. All rights reserved.
//

#import "LMViewController.h"
#import <LMExpandableCircularAnimation/LMCircularLoaderAnimationView.h>

@interface LMViewController () {
    
    LMCircularLoaderAnimationView *_circularLoaderAnimationView;
}

@end

@implementation LMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    
    [self createAndDisplayLoaderAnimation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private helper methods
- (void)createAndDisplayLoaderAnimation
{
    if (!_circularLoaderAnimationView)
    {
        _circularLoaderAnimationView = [[LMCircularLoaderAnimationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _circularLoaderAnimationView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_circularLoaderAnimationView];
    }
    
    [_circularLoaderAnimationView startAnimation];
}

@end
