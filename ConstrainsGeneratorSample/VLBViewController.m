//
//  VLBViewController.m
//  ConstrainsGeneratorSample
//
//  Created by Ibrahim Kteish on 1/30/14.
//  Copyright (c) 2014 vinelab. All rights reserved.
//

#import "VLBViewController.h"
#import "VLBConstraintsGenerator.h"

#define nonStaticViewLeading @"leading"
@interface VLBViewController ()

@end

@implementation VLBViewController
{
    NSMutableDictionary *constraintsHolder;
    UIView *nonStaticView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    VLBConstraintsGenerator *cnsGen = [VLBConstraintsGenerator sharedInstance];
    
    UIView *superView = self.view;
    
    UIView *mainView = [UIView autolayoutView];
    [superView addSubview:mainView];
    [mainView setBackgroundColor:[UIColor redColor]];
    
    [cnsGen setWidth:70 andHeight:60 forView:mainView inSuperView:superView];
    [cnsGen setLeading:100 forView:mainView inSuperView:superView];
    [cnsGen setTop:100 forView:mainView inViewController:self];

    UILabel *mainLabel = [UILabel autolayoutView];
    [mainView addSubview:mainLabel];
    [cnsGen centerView:mainLabel inSuperView:mainView withPercentage:60];
    [mainLabel setTextAlignment:NSTextAlignmentCenter];
    [mainLabel setText:@"main"];
    
    UIView *secondView = [UIView autolayoutView];
    [superView addSubview:secondView];
    [cnsGen setWidth:60 andHeight:60 forView:secondView inSuperView:superView];
    [secondView setBackgroundColor:[UIColor yellowColor]];
    
    [cnsGen addView:secondView
          underView:mainView
        inSuperView:superView
        separatedBy:10];

    
    UIView *thirdView = [UIView autolayoutView];
    [superView addSubview:thirdView];
    [cnsGen setWidth:60 andHeight:60 forView:thirdView inSuperView:superView];
    [thirdView setBackgroundColor:[UIColor purpleColor]];

    UIView *fourthView = [UIView autolayoutView];
    [thirdView addSubview:fourthView];
    [cnsGen centerView:fourthView inSuperView:thirdView withPercentage:70];
    [fourthView setBackgroundColor:[UIColor greenColor]];

    UIView *fifthView = [UIView autolayoutView];
    [superView addSubview:fifthView];
    [cnsGen setWidth:60 andHeight:60 forView:fifthView inSuperView:superView];
    [fifthView setBackgroundColor:[UIColor brownColor]];

    UIView *sixthView = [UIView autolayoutView];
    [superView addSubview:sixthView];
    [cnsGen setWidth:60 andHeight:60 forView:sixthView inSuperView:superView];
    [sixthView setBackgroundColor:[UIColor grayColor]];

    
    [cnsGen alignHorizontallyViews:@[fifthView,sixthView]
                        toMainView:mainView
                       inSuperView:superView
                       separatedBy:10
                       WithOptions:NSLayoutFormatAlignAllCenterY
                        isReversed:NO];
    
    [cnsGen addView:secondView
          underView:mainView
        inSuperView:superView
        separatedBy:10];
    
    [cnsGen addView:thirdView
          aboveView:mainView
        inSuperView:superView
        separatedBy:10];
 
    
    constraintsHolder = [NSMutableDictionary new];
    
    nonStaticView = [UIView autolayoutView];
    [superView addSubview:nonStaticView];
    [nonStaticView setBackgroundColor:[UIColor blueColor]];
    [cnsGen setLeading:60 forView:nonStaticView inSuperView:superView AddToDictionary:constraintsHolder ConstraintName:nonStaticViewLeading];
    [cnsGen setBottom:10 forView:nonStaticView inViewController:self];
    [cnsGen setWidth:60 andHeight:60 forView:nonStaticView inSuperView:superView];

    NSTimer *timer =  [NSTimer timerWithTimeInterval:2 target:self selector:@selector(hideShowView) userInfo:Nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

}

-(void)hideShowView
{
    NSLayoutConstraint *leading = constraintsHolder[nonStaticViewLeading];
    
    leading.constant = -leading.constant;
    
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
