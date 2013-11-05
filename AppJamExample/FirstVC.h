//
//  FirstVC.h
//  AppJamExample
//
//  Created by Matthew on 11/3/13.
//  Copyright (c) 2013 Matthew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstVC : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>

@property (nonatomic) UISlider *slider;
@property (nonatomic) UITextView *sliderVal;
@end
