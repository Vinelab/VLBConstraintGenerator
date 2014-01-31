
VLBConstraintsGenerator is a handy class for working with AutoLayout (by code) on iOS. it allows you to add subview to the Left/Right/Above/Under other View, also Center a subview in its superView with scaling of (width/height), Align View(s) Vertically/Horizontally according to main view, and many other useful functions (leading/trailing/Top/Bottom), initializing a View that support autolayout all this in just a few lines of code.

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

## Bugs & Feature Requests
There is no support offered with this component. If you would like a feature or find a bug, please submit a feature request through the [GitHub issue tracker](https://github.com/ibrahimkteish/VLBConstraintGenerator/issues).

Pull-requests for bug-fixes and features are welcome!

##Contributing

If you want to contribute to the project just follow this steps:

Fork the repository.

Clone your fork to your local machine.

Create your feature branch with the appropriate tests.

Commit your changes, push to your fork and submit a pull request.

## Contact

ibrahimk@vinelab.com or [@Bobj_c](https://twitter.com/Bobj_c)

## License

VLBConstraintsGenerator is available under the [MIT license](http://en.wikipedia.org/wiki/MIT_License).
