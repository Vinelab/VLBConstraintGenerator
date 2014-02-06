//
//  VLBConstraintsGenerator.h
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

#import <Foundation/Foundation.h>

@interface UIView  (HierarchyAndAutoLayout)

+(id)autolayoutView;
- (BOOL) isContainsView: (UIView *) theView;

@end

@implementation UIView (HierarchyAndAutoLayout)

- (NSArray *) superviews
{
    NSMutableArray *array = [NSMutableArray array];
    
    UIView *view = self.superview;
    while (view)
    {
        [array addObject:view];
        view = view.superview;
    }
    return array;
}

+(id)autolayoutView
{
    UIView *view =  [[self class] new];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    return view;
}


- (BOOL) isContainsView: (UIView *) theView
{
    return [[theView superviews] containsObject:self];
}

@end


@interface VLBConstraintsGenerator : NSObject

+ (VLBConstraintsGenerator *)sharedInstance;

/**
 *  Set the Width value of a view
 *
 *  @param theWidth     The Width of the view
 *  @param theView      The View
 *  @param theSuperView The SuperView of the view
 */
-(void)setWidth:(CGFloat)theWidth forView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Set the Width value of a view with a priority
 *
 *  @param theWidth     The Width of the view
 *  @param theView      The View
 *  @param theSuperView The SuperView of the view
 *  @param thePriority  thePriority value between 1~1000
 */

-(void)setWidth:(CGFloat)theWidth forView:(UIView *)theView inSuperView:(UIView *)theSuperView withPriority:(NSUInteger)thePriority;

/**
 *  Set the Width and the Height values of a view
 *
 *  @param theWidth     The Width of the view
 *  @param theHeight    The Height of the view
 *  @param theView      The View
 *  @param theSuperView View's superview
 */
-(void)setWidth:(CGFloat)theWidth andHeight:(CGFloat)theHeight forView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Set  Width,Height and Trailing values of a View
 *
 *  @param theWidth     The Width of the view
 *  @param theHeight    The Height of the view
 *  @param theLeading   the Leading Value
 *  @param theView      the View
 *  @param theSuperView View's Superview
 */
-(void)setWidth:(CGFloat)theWidth andHeight:(CGFloat)theHeight leading:(CGFloat)theLeading forView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Set the Width and the Height values of a view and Trailing value
 *
 *  @param theWidth     The Width of the view
 *  @param theHeight    The Height of the view
 *  @param theView      The View
 *  @param theTrailing  The Trailing value
 *  @param theSuperView View's superview
 */
-(void)setWidth:(CGFloat)theWidth andHeight:(CGFloat)theHeight trailing:(CGFloat)theTrailing forView:(UIView *)theView inSuperView:(UIView *)theSuperView;


/**
 *  Set the Height value of a view
 *
 *  @param theHeight    The Height of the view
 *  @param theView      The View
 *  @param theSuperView The SuperView of the view
 */
-(void)setHeight:(CGFloat)theHeight forView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Set the Height value of a view with Priority
 *
 *  @param theHeight    The Height of the view
 *  @param theView      The View
 *  @param theSuperView The SuperView of the view
 *  @param thePriority  thePriority value between 1~1000
 */
-(void)setHeight:(CGFloat)theHeight forView:(UIView *)theView inSuperView:(UIView *)theSuperView withPriority:(NSUInteger)thePriority;

/**
 *  Set Top space between the view and the Top (MinY) of its SuperView
 *
 *  @param theTopValue  The Top Space Value
 *  @param theView      The View
 *  @param theSuperView The SuperView of the view
 */
-(void)setTop:(CGFloat )theTopValue forView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Set Top space between the view and the Top (MinY) of its SuperView.The main purpose of this function is to take the advantage of iOS 7 "topLayoutGuide" property that is why we need to pass the view controller
 *
 *  @param theTopValue       The Top Space Value
 *  @param theView           The View
 *  @param theViewController The ViewController
 */
-(void)setTop:(CGFloat )theTopValue forView:(UIView *)theView inViewController:(UIViewController *)theViewController;

/**
 *  Set The Leading value of a View
 *
 *  @param theLeading   The Leading Value
 *  @param theView      The View
 *  @param theSuperView View's superview
 */
-(void)setLeading:(CGFloat )theLeading forView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Set The Leading value of a View with a specific Name in order to add it as key in the Changeable Dictionary so we can get it later and modify it (use this if you want to to animate a view from off screen position  to in screen)
 *
 *  @param theLeading            The Leading Value
 *  @param theView               The View
 *  @param theSuperView          View's superview
 *  @param changeableConstraints The Dictionay to hold the reference of the constrain
 *  @param theName               Key of this Constraint in the Dictionary
 */
-(void)setLeading:(CGFloat )theLeading forView:(UIView *)theView inSuperView:(UIView *)theSuperView AddToDictionary:(NSMutableDictionary *)changeableConstraints ConstraintName:(NSString *)theName;

/**
 *  Set The Trailing value of a View
 *
 *  @param theTrailing   The Trailing POSITIVE Value the class will make it negative
 *  @param theView       The View
 *  @param theSuperView  View's superview
 */
-(void)setTrailing:(CGFloat )theValue forView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Set the Bottom value of a View
 *
 *  @param theBottom    The Bottom value (shouldn't be negative)
 *  @param theView      The View
 *  @param theSuperView View's superview
 */
-(void)setBottom:(CGFloat )theBottom forView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Set the Bottom value of a View
 *
 *  @param theBottomValue    The Bottom value (shouldn't be negative)
 *  @param theView           The View
 *  @param theViewController The ViewController
 */
-(void)setBottom:(CGFloat )theBottomValue forView:(UIView *)theView inViewController:(UIViewController *)theViewController;

/**
 *  Center a View in the middle of its superview and get its Width an Height
 *
 *  @param theView      The View
 *  @param theSuperView The SuperView of the View
 */
-(void)centerView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Center a View in its superView with Width = superview.width * percentage same for Height
 *
 *  @param theView       The View
 *  @param theSuperView  The SuperView
 *  @param thePercentage The Percentage value between 1~100
 */
-(void)centerView:(UIView *)theView inSuperView:(UIView *)theSuperView withPercentage:(CGFloat)thePercentage;

/**
 *  Center a View in its superView and specifying the width and height percentage.
 *
 *  @param theView             The View
 *  @param theSuperView        The SuperView
 *  @param theHeightPercentage The Height Percentage value 1~100
 *  @param theWidthPercentage  The Width Percentage  value 1~100
 */
-(void)centerView:(UIView *)theView inSuperView:(UIView *)theSuperView withHeightPercentage:(CGFloat)theHeightPercentage andWidthPercentage:(CGFloat)theWidthPercentage;

/**
 *  Center the View along the x-axis of it superview alignment rectangle.
 *
 *  @param theView      The View
 *  @param theSuperView The SuperView 
 */
-(void)centerXForView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Center the View along the y-axis of it superview alignment rectangle.
 *
 *  @param theView      The View
 *  @param theSuperView The SuperView
 */
-(void)centerYForView:(UIView *)theView inSuperView:(UIView *)theSuperView;

/**
 *  Align the View Vertically with respect to other View, use the isReversed Bool in order to specifiey alignment Top or bottom of the main view
 *
 *  @param theView         The View
 *  @param theMainView     The MainView
 *  @param theSuperView    The SuperView
 *  @param theValue        The Value
 *  @param theOptions      The Options
 *  @param theReversedBOOL The ReversedBOOL (top or bottom)
 */

-(void)alignVerticallyView:(UIView *)theView toMainView:(UIView *)theMainView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat)theValue WithOptions:(NSLayoutFormatOptions)theOptions isReversed:(BOOL)theReversedBOOL;

/**
 *  Align an  Array of Views Vertically with respect to other View, use the isReversed Bool in order to specifiey alignment Top or bottom of the main view
 *
 *  @param theViews        the Views array
 *  @param theMainView     The MainView
 *  @param theSuperView    The SuperView
 *  @param theValue        The Value
 *  @param theOptions      The Options
 *  @param theReversedBOOL The ReversedBOOL (top or bottom)
 */

-(void)alignVerticallyViews:(NSArray *)theViews toMainView:(UIView *)theMainView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat)theValue WithOptions:(NSLayoutFormatOptions)theOptions isReversed:(BOOL)theReversedBOOL;

/**
 *  Align the View Horizontally with respect to other View, use the isReversed Bool in order to specifiey alignment Left or Right of the main view.
 *
 *  @param theView         The View
 *  @param theMainView     The MainView
 *  @param theSuperView    The SuperView
 *  @param theValue        The Value
 *  @param theOptions      The Options
 *  @param theReversedBOOL The ReversedBOOL (Left or Right)
 */
-(void)alignHorizontallyView:(UIView *)theView toMainView:(UIView *)theMainView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat)theValue WithOptions:(NSLayoutFormatOptions)theOptions isReversed:(BOOL)theReversedBOOL;

/**
 *  Align an Array of Views Horizontally with respect to other View, use the isReversed Bool in order to specifiey alignment Left or Right of the main view.
 *
 *  @param theViews        the Views array
 *  @param theMainView     The MainView
 *  @param theSuperView    The SuperView
 *  @param theValue        The Value
 *  @param theOptions      The Options
 *  @param theReversedBOOL The ReversedBOOL (Left or Right)
 */
-(void)alignHorizontallyViews:(NSArray *)theViews toMainView:(UIView *)theMainView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat)theValue WithOptions:(NSLayoutFormatOptions)theOptions isReversed:(BOOL)theReversedBOOL;

/**
 *  Add a View to the left of another View with spacing
 *
 *  @param theView      The View
 *  @param theOtherView The OtherView
 *  @param theSuperView The SuperView
 *  @param theValue     The Value
 */

-(void)addView:(UIView *)theView toTheRightOfView:(UIView *)theOtherView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat )theValue;

/**
 *  Add a View to the Right of another View with spacing
 *
 *  @param theView      The View
 *  @param theOtherView The OtherView
 *  @param theSuperView The SuperView
 *  @param theValue     The Value
 */

-(void)addView:(UIView *)theView toTheLeftOfView:(UIView *)theOtherView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat )theValue;

/**
 *  Add a under to the left of another view with spacing
 *
 *  @param theView      The View
 *  @param theOtherView The OtherView
 *  @param theSuperView The SuperView
 *  @param theValue     The Value
 */

-(void)addView:(UIView *)theView underView:(UIView *)theOtherView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat )theValue;

/**
 *  Add a above to the left of another view with spacing
 *
 *  @param theView      The View
 *  @param theOtherView The OtherView
 *  @param theSuperView The SuperView
 *  @param theValue     The Value
 */
-(void)addView:(UIView *)theView aboveView:(UIView *)theOtherView inSuperView:(UIView *)theSuperView separatedBy:(CGFloat )theValue;
@end
