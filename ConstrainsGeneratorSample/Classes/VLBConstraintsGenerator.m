//
//  VLBConstraintsGenerator.m
//  yara
//
//  Created by Ibrahim Kteish on 12/23/13.
//  Copyright (c) 2013 VineLab FZ LLC. All rights reserved.
//

//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.


#define kDefautlConstraintPriority 1000
#define is_iOS_7 [[UIDevice currentDevice].systemVersion hasPrefix:@"7"]

#import "VLBConstraintsGenerator.h"

@implementation VLBConstraintsGenerator

+ (VLBConstraintsGenerator *)sharedInstance
{
    static VLBConstraintsGenerator *sharedGen = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Create and return the CG
        sharedGen = [[VLBConstraintsGenerator alloc] init];
    });
    
    return sharedGen;
}

-(void)setWidth:(CGFloat)theWidth andHeight:(CGFloat)theHeight leading:(CGFloat)theLeading forView:(UIView *)theView inSuperView:(UIView *)theSuperView;

{
    [self setWidth:theWidth andHeight:theHeight forView:theView inSuperView:theSuperView];
    [self setLeading:theLeading forView:theView inSuperView:theSuperView];
}

-(void)setWidth:(CGFloat)theWidth andHeight:(CGFloat)theHeight trailing:(CGFloat)theTrailing forView:(UIView *)theView inSuperView:(UIView *)theSuperView
{
    [self setWidth:theWidth andHeight:theHeight forView:theView inSuperView:theSuperView];
    [self setTrailing:theTrailing forView:theView inSuperView:theSuperView];
}

-(void)setWidth:(CGFloat)theWidth andHeight:(CGFloat)theHeight forView:(UIView *)theView inSuperView:(UIView *)theSuperView
{
    [self setWidth:theWidth   forView:theView inSuperView:theSuperView];
    [self setHeight:theHeight forView:theView inSuperView:theSuperView];
}

-(void)centerXForView:(UIView *)theView inSuperView:(UIView *)theSuperView
{
    NSLayoutConstraint  *cn = [NSLayoutConstraint constraintWithItem:theView
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:theSuperView
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1
                                                            constant:0];
    [theSuperView addConstraint: cn];
}

-(void)centerYForView:(UIView *)theView inSuperView:(UIView *)theSuperView
{
    NSLayoutConstraint  *cn = [NSLayoutConstraint constraintWithItem:theView
                                                           attribute:NSLayoutAttributeCenterY
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:theSuperView
                                                           attribute:NSLayoutAttributeCenterY
                                                          multiplier:1
                                                            constant:0];
    [theSuperView addConstraint: cn];
}

-(void)setTrailing:(CGFloat )theValue forView:(UIView *)theView inSuperView:(UIView *)theSuperView
{

    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:theSuperView
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1
                                                           constant:-(theValue)];
    [theSuperView addConstraint:cn];
}



-(void)setWidth:(CGFloat )theWidth forView:(UIView *)theView inSuperView:(UIView *)theSuperView withPriority:(NSUInteger)thePriority
{
    NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    
    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1
                                                           constant:theWidth];
    [cn setPriority:thePriority];
    [theSuperView addConstraint:cn];
}

-(void)setWidth:(CGFloat )theWidth forView:(UIView *)theView inSuperView:(UIView *)theSuperView
{
    [self setWidth:theWidth forView:theView inSuperView:theSuperView withPriority:kDefautlConstraintPriority];
}

-(void)setHeight:(CGFloat)theHeight forView:(UIView *)theView inSuperView:(UIView *)theSuperView withPriority:(NSUInteger)thePriority
{
        NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    
    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1
                                                           constant:theHeight];
    [cn setPriority:thePriority];
    
    [theSuperView addConstraint:cn];
}

-(void)setHeight:(CGFloat )theHeight forView:(UIView *)theView inSuperView:(UIView *)theSuperView
{
    [self setHeight:theHeight forView:theView inSuperView:theSuperView withPriority:kDefautlConstraintPriority];
}

-(void)setLeading:(CGFloat )theLeading forView:(UIView *)theView inSuperView:(UIView *)theSuperView AddToDictionary:(NSMutableDictionary *)changeableConstraints ConstraintName:(NSString *)theName
{

    NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    NSAssert(changeableConstraints != nil, @"Dictionary cannot be nil");
    NSAssert(theName != nil, @"Constraint name cannot not be nil");
    NSAssert(changeableConstraints[theName] == nil, @"Constraint name is already in use please specify another one");
    
    
    
    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:theSuperView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1
                                                           constant:theLeading];
    changeableConstraints[theName] = cn;
    
    [theSuperView addConstraint:cn];
    
}

-(void)setLeading:(CGFloat )theLeading forView:(UIView *)theView inSuperView:(UIView *)theSuperView
{
        NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    
    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:theSuperView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1
                                                           constant:theLeading];
    
    [theSuperView addConstraint:cn];
}

-(void)setBottom:(CGFloat )theBottom forView:(UIView *)theView inSuperView:(UIView *)theSuperView
{
        NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    
    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:theSuperView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:-(theBottom)];
    [theSuperView addConstraint:cn];
}

-(void)setTop:(CGFloat )theTopValue forView:(UIView *)theView inViewController:(UIViewController *)theViewController
{
    if (is_iOS_7)
    {
        UIView *topLayoutGuide = (UIView *) theViewController.topLayoutGuide;
        [self alignVerticallyView:theView toMainView:topLayoutGuide inSuperView:theViewController.view separatedBy:theTopValue WithOptions:0 isReversed:NO];
    }
    else
        [self setTop:theTopValue forView:theView inSuperView:theViewController.view];
    
    
}

//The main purpose of this function is to take the advantage of iOS 7 "bottomLayoutGuide" property that is why we need
//to pass the view controller
-(void)setBottom:(CGFloat )theBottomValue forView:(UIView *)theView inViewController:(UIViewController *)theViewController
{
    assert([theViewController.view isEqual:theView.superview]);

    if (is_iOS_7)
    {
        UIView *bottomLayoutGuide = (UIView *) theViewController.bottomLayoutGuide;
        [self alignVerticallyView:theView toMainView:bottomLayoutGuide inSuperView:theViewController.view separatedBy:theBottomValue WithOptions:0 isReversed:YES];
    }
    else
        [self setBottom:theBottomValue forView:theView inSuperView:theViewController.view];
}


-(void)setTop:(CGFloat )theTopValue forView:(UIView *)theView inSuperView:(UIView *)theSuperView
{
        NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    
    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:theSuperView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:theTopValue];
    
    [theSuperView addConstraint:cn];
}


-(void)centerView:(UIView *)theView inSuperView:(UIView *)theSuperView
{
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(theView);
    NSArray *constraints = [NSLayoutConstraint
                            constraintsWithVisualFormat:@"H:|[theView]|"
                            options:0
                            metrics:nil
                            views:viewsDictionary];
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint
                    constraintsWithVisualFormat:@"V:|[theView]|"
                    options:0
                    metrics:nil
                    views:viewsDictionary]];
    
    [theSuperView addConstraints:constraints];
}

-(void)centerView:(UIView *)theView inSuperView:(UIView *)theSuperView withPercentage:(CGFloat)thePercentage
{
        NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    assert(thePercentage <= 100);
    
    //between 0~1
    CGFloat percentage = thePercentage/100;
    assert(percentage > 0);
    assert(percentage <= 1);
    
    [self centerXForView:theView inSuperView:theSuperView];
    [self centerYForView:theView inSuperView:theSuperView];
    
    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:theSuperView
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:percentage
                                                           constant:0];
    [theSuperView addConstraint:cn];
    
    cn = [NSLayoutConstraint constraintWithItem:theView
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:theSuperView
                                      attribute:NSLayoutAttributeWidth
                                     multiplier:percentage
                                       constant:0];
    [theSuperView addConstraint: cn];
    
}
-(void)centerView:(UIView *)theView inSuperView:(UIView *)theSuperView withHeightPercentage:(CGFloat)theHeightPercentage andWidthPercentage:(CGFloat)theWidthPercentage
{
        NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    assert(theHeightPercentage <= 100);
    assert(theWidthPercentage  <= 100);
    
    //between 0~1
    CGFloat hPercentage = theHeightPercentage/100;
    assert(hPercentage > 0);
    assert(hPercentage <= 1);
    
    CGFloat wPercentage = theWidthPercentage/100;
    assert(wPercentage > 0);
    assert(wPercentage <= 1);
    
    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:theSuperView
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:hPercentage
                                                           constant:0];
    [theSuperView addConstraint:cn];
    
    cn = [NSLayoutConstraint constraintWithItem:theView
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:theSuperView
                                      attribute:NSLayoutAttributeWidth
                                     multiplier:wPercentage
                                       constant:0];
    [theSuperView addConstraint: cn];
    
    [self centerXForView:theView inSuperView:theSuperView];
    [self centerYForView:theView inSuperView:theSuperView];
    
    
}



//Align
-(void)alignVerticallyView:(UIView *)theView toMainView:(UIView *)theMainView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat)theValue WithOptions:(NSLayoutFormatOptions)theOptions isReversed:(BOOL)theReversedBOOL
{
    NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    NSAssert([theSuperView isContainsView:theMainView], @"the View must be belong to its superview");
    NSAssert(![theSuperView isEqual:theView], @"the View must be different than its superview");
    NSAssert(![theSuperView isEqual:theMainView], @"the View must be different than its superview");
    
    NSDictionary *views = NSDictionaryOfVariableBindings(theView,theMainView);
    
    NSDictionary *metrics = @{@"space":@(theValue)};
    
    NSString *visualString = @"V:[theMainView]-space-[theView]";
    
    if (theReversedBOOL == YES)
    {
       visualString = @"V:[theView]-space-[theMainView]";
    }
    
    NSArray *cns = [NSLayoutConstraint constraintsWithVisualFormat:visualString
                                                           options:theOptions
                                                           metrics:metrics
                                                             views:views];
    
    [theSuperView addConstraints:cns];
}

-(void)alignVerticallyViews:(NSArray *)theViews toMainView:(UIView *)theMainView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat)theValue WithOptions:(NSLayoutFormatOptions)theOptions isReversed:(BOOL)theReversedBOOL
{
    NSAssert(theViews.count >= 1, @"the lenght of Views Array must be greater than 0");
    [self alignVerticallyView:theViews[0] toMainView:theMainView inSuperView:theSuperView separatedBy:theValue WithOptions:theOptions isReversed:theReversedBOOL];
    
    for (int i = 0 ; i < theViews.count - 1;)
    {
        UIView *aView = theViews[i];
        UIView *aNextView = theViews[++i];
        [self alignVerticallyView:aNextView toMainView:aView inSuperView:theSuperView separatedBy:theValue WithOptions:theOptions isReversed:theReversedBOOL];
    }

}


-(void)alignHorizontallyViews:(NSArray *)theViews toMainView:(UIView *)theMainView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat)theValue WithOptions:(NSLayoutFormatOptions)theOptions isReversed:(BOOL)theReversedBOOL
{
        NSAssert(theViews.count >= 1, @"the lenght of Views Array must be greater than 0");
        
        [self alignHorizontallyView:theViews[0] toMainView:theMainView inSuperView:theSuperView separatedBy:theValue WithOptions:theOptions isReversed:theReversedBOOL];
        
        for (int i = 0 ; i < theViews.count - 1;)
        {
            UIView *aView = theViews[i];
            UIView *aNextView = theViews[++i];
            [self alignHorizontallyView:aNextView toMainView:aView inSuperView:theSuperView separatedBy:theValue WithOptions:theOptions isReversed:theReversedBOOL];
        }
}

-(void)alignHorizontallyView:(UIView *)theView toMainView:(UIView *)theMainView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat)theValue WithOptions:(NSLayoutFormatOptions)theOptions isReversed:(BOOL)theReversedBOOL
{
    NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    NSAssert([theSuperView isContainsView:theMainView], @"the View must be belong to its superview");
    NSAssert(![theSuperView isEqual:theView], @"the View must be different than its superview");
    NSAssert(![theSuperView isEqual:theMainView], @"the View must be different than its superview");
    
    NSDictionary *views = NSDictionaryOfVariableBindings(theView,theMainView);
    
    NSDictionary *metrics = @{@"space":@(theValue)};
    
    NSString *visualString = @"H:[theMainView]-space-[theView]";
    
    if (theReversedBOOL == YES)
    {
        visualString = @"H:[theView]-space-[theMainView]";
    }
    
    NSArray *cns = [NSLayoutConstraint constraintsWithVisualFormat:visualString
                                                           options:theOptions
                                                           metrics:metrics
                                                             views:views];
    
    [theSuperView addConstraints:cns];

}

-(void)addView:(UIView *)theView toTheRightOfView:(UIView *)theOtherView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat )theValue
{
    NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    assert(![theView isEqual:theOtherView]);

    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:theOtherView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:theValue];
    [theSuperView addConstraint:cn];

}
/*
 
 Same As alignHorizontallyView:... but you need to switch the views

 Another Implementation can be as below
 [self addView:theOtherView toTheRightOfView:theView inSuperView:theSuperView separatedBy:theValue];

*/
-(void)addView:(UIView *)theView toTheLeftOfView:(UIView *)theOtherView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat )theValue
{
    NSAssert([theSuperView isContainsView:theView], @"the View must be belong to its superview");
    assert(![theView isEqual:theOtherView]);
    
    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:theView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:theOtherView
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:-theValue];
    [theSuperView addConstraint:cn];
    
}


/*
 |--------------|
 | theOtherView |
 |--------------|
   separatedBY
 |--------------|
 |   theView    |
 |--------------|
 */

-(void)addView:(UIView *)theView underView:(UIView *)theOtherView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat )theValue
{
    [self alignVerticallyView:theView toMainView:theOtherView inSuperView:theSuperView separatedBy:theValue WithOptions:NSLayoutFormatAlignAllCenterX isReversed:NO];
}


/*
 |--------------|
 |   theView    |
 |--------------|
   separatedBY
 |--------------|
 | theOtherView |
 |--------------|
 */

-(void)addView:(UIView *)theView aboveView:(UIView *)theOtherView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat )theValue
{
    [self alignVerticallyView:theView toMainView:theOtherView inSuperView:theSuperView separatedBy:theValue WithOptions:NSLayoutFormatAlignAllCenterX isReversed:YES];

}
@end
