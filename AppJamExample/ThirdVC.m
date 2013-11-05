//
//  ThirdVC.m
//  AppJamExample
//
//  Created by Matthew on 11/4/13.
//  Copyright (c) 2013 Matthew. All rights reserved.
//

#import "ThirdVC.h"

@interface ThirdVC()

//private variables
@property(nonatomic, retain) UILabel *nth_fib;
@property(nonatomic, retain) UILabel *time_taken;
@property (nonatomic, retain) IBOutlet UISwitch *fibSwitch;
@end

@implementation ThirdVC

-(id)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        
        //get the tab bar item and give it a label
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Fibonacci"];
        
        //create a UIImage from a file and put image on the tab bar item
        UIImage *i = [UIImage imageNamed:@"abt.png"];
        [tbi setImage:i];
    }
    
    return self;
}

-(id)initWithDismissButton
{
    self = [self init];
    
    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [dismissBtn setTitle:@"Dismiss" forState:UIControlStateNormal];
    [dismissBtn addTarget:self action:@selector(userPressedDismiss) forControlEvents:UIControlEventTouchUpInside];
    dismissBtn.frame = CGRectMake(220, 10, 100, 60);
    [self.view addSubview:dismissBtn];
    return self;
}

-(void)userPressedDismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self insertLabels];    //my own custom methods
    [self insertTextField];
    
    self.fibSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(240, 80, 90, 40)];
    [self.view addSubview:self.fibSwitch];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    //grab the string value from the textfield and turn it to an int
    int target = [textField.text intValue];

    [self beginFibonnaciCalcuations:target];
    
    return NO;
}

-(void)insertLabels
{
    UILabel *my_label = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 200, 20)];
    my_label.text=@"nth Fibonnaci Number";
    my_label.font = [UIFont boldSystemFontOfSize:16.0];
    my_label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:my_label];
    
    self.nth_fib = [[UILabel alloc] initWithFrame:CGRectMake(20, 180, 300, 20)];
    self.nth_fib.text=@"nth Fib:";
    self.nth_fib.font = [UIFont systemFontOfSize:22.0];
    self.nth_fib.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.nth_fib];
    
    self.time_taken = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, 300, 20)];
    self.time_taken.text=@"Elapsed Time:";
    self.time_taken.font = [UIFont systemFontOfSize:22.0];
    self.time_taken.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.time_taken];

}

-(void)insertTextField
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 125, 300, 25)];
    textField.delegate = self;
    textField.placeholder = @"Give me a number";
    textField.textAlignment = NSTextAlignmentCenter;
    textField.borderStyle= UITextBorderStyleLine;
    [self.view addSubview:textField];

}

-(void)beginFibonnaciCalcuations:(int)num
{
    // Fibonnaci Series: 0, 1, 1, 2, 3, 5, 8, 13, 21, ...
    
    NSTimeInterval start = [[NSDate date] timeIntervalSinceReferenceDate];
    int nthFib;
    
    if (self.fibSwitch.on) {
        // use the faster fib function
        nthFib = [self fib2:num];
    } else {
        nthFib = [self fib1:num];
    }
    
    NSTimeInterval end = [[NSDate date] timeIntervalSinceReferenceDate];
    
    self.nth_fib.text = [NSString stringWithFormat:@"nth Fib: \t%d", nthFib];
    self.time_taken.text = [NSString stringWithFormat:@"Elapsed Time: %f", (end-start)];
}

-(int)fib1:(int)n
{
    // Runtime: O(2^n)
    
    if (n == 0 || n == 1) {
        return n;
    } else {
        return [self fib1:(n - 1)] + [self fib1:(n-2)];
    }
}

-(int)fib2:(int)n
{
    // Runtime: O(n)

    int first = 0;
    int sec = 1;
    int third = first + sec;
    
    for (int i = 1; i < n; i++) {
        third = first + sec;
        first = sec;
        sec = third;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    return third;
}


@end
