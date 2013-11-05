//
//  FirstVC.m
//  AppJamExample
//
//  Created by Matthew on 11/3/13.
//  Copyright (c) 2013 Matthew. All rights reserved.
//

#import "FirstVC.h"
#import "ThirdVC.h"

@implementation FirstVC

-(id)init{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
//        UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bkg1.jpg"]];
//        [self.view addSubview:backgroundImage];
//        [self.view sendSubviewToBack:backgroundImage];
        
        //get the tab bar item and give it a label
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"1st VC"];
        
        //create a UIImage from a file and put image on the tab bar item
        UIImage *i = [UIImage imageNamed:@"fav.png"];
        [tbi setImage:i];
    }
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self insertSampleLabelWithTitle:@"Greetings Anteaters!" andFontSize:16.0];
    [self insertSampleTextField];
    [self insertSampleSlider];
    [self insertTextViewForSlider];
    [self insertSampleButtonWithText:@"How are you?"];
    [self insertSampleButtonWithImage];
}

#pragma mark Sample UI Elements
-(void)insertSampleLabelWithTitle:(NSString *)title andFontSize:(double)size
{
    UILabel *my_label = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 300, 20)];
    my_label.text= title;
    my_label.font = [UIFont boldSystemFontOfSize:size];
    my_label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:my_label];
}

-(void)insertSampleTextField
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 75, 300, 25)];
    textField.delegate = self;
    textField.placeholder = @"Placeholder text";
    textField.borderStyle= UITextBorderStyleLine;
    [self.view addSubview:textField];
}

-(void)insertSampleSlider
{
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 170, 300, 20)];
    self.slider.minimumValue=1;
    self.slider.maximumValue=10;
    [self.slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
}

-(void)insertTextViewForSlider
{
    self.sliderVal = [[UITextView alloc] initWithFrame:CGRectMake(270, 135, 40, 30)];
    self.sliderVal.userInteractionEnabled = NO;
    self.sliderVal.font = [UIFont boldSystemFontOfSize:20.0];
    [self.sliderVal setBackgroundColor:[UIColor clearColor]];
    self.sliderVal.text = @"0";
    [self.view addSubview:self.sliderVal];
}

-(void)insertSampleButtonWithText:(NSString *)txt
{
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [confirmBtn setTitle:txt forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(userPressedConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    confirmBtn.frame = CGRectMake(90, 190, 160, 60);
    [self.view addSubview:confirmBtn];
}

-(void)insertSampleButtonWithImage
{
    UIButton *randomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [randomBtn addTarget:self
                  action:@selector(revealFib)
        forControlEvents:UIControlEventTouchDown];
    [randomBtn setImage:[UIImage imageNamed:@"onBtn.png"] forState:UIControlStateNormal];
    randomBtn.frame = CGRectMake(125.0, 240.0, 87.0, 87.0);
    [self.view addSubview:randomBtn];
}

#pragma mark Other Function

-(void)revealFib
{
    ThirdVC *fibVC = [[ThirdVC alloc] initWithDismissButton];
    [self presentViewController:fibVC animated:YES completion:nil];
}

-(void) sliderChanged:(UISlider *) slider
{
    int integer = (int) floor(self.slider.value);
    self.sliderVal.text = [NSString stringWithFormat:@"%d" , integer];
}

-(void)userPressedConfirmButton
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Greetings" message:@"How are you?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Great!", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;{
    
    // the user clicked OK
    if (buttonIndex == 0)
    {
        NSLog(@"Bummer...");
    } else if (buttonIndex == 1) {
        //user clicked "Great!"
        NSLog(@"I'm happy that you're awesome!");
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
