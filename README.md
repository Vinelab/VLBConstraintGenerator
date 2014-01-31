
VLBConstraintsGenerator is a handy class for working with AutoLayout (by code) on iOS. 

## How To Get Started

1- Clone the project.

2- Drag the VLBConstraintsGenerator.{h/m} to your project.

Sample Usage here:

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

Also you can see the sample project.

## Requirements

VLBConstraintsGenerator requires Xcode 5, targeting either iOS 6.0 and above,

## Usage

Please see the sample project. also take a look or fuctions comment.

## Credits

VLBConstraintsGenerator was created by [Ibrahim Kteish](https://github.com/ibrahimkteish/) in the development of a project with [vinelab](http://vinelab.com/).

## Contact

ibrahimk@vinelab.com

## License

VLBConstraintsGenerator is available under the [MIT license](http://en.wikipedia.org/wiki/MIT_License).
