//
//  SecondVC.h
//  AppJamExample
//
//  Created by Matthew on 11/3/13.
//  Copyright (c) 2013 Matthew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondVC : UIViewController <UIAlertViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableOfThings;
@property (nonatomic, strong) NSMutableArray *allThings;
@property (nonatomic) UIAlertView *alertForNewName;
@end
