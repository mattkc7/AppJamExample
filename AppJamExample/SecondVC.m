//
//  SecondVC.m
//  AppJamExample
//
//  Created by Matthew on 11/3/13.
//  Copyright (c) 2013 Matthew. All rights reserved.
//

#import "SecondVC.h"
#import "AppDelegate.h"
#import "ThirdVC.h"

@implementation SecondVC

-(id)init{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor yellowColor];
        self.navigationItem.title = @"2nd VC";
        //get the tab bar item and give it a label
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"2nd VC"];
        
        //create a UIImage from a file and put image on the tab bar item
        UIImage *i = [UIImage imageNamed:@"abt.png"];
        [tbi setImage:i];
    }
    
    return self;
}

-(void)viewDidLoad
{
    UIBarButtonItem *newItemBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createNewThing)];
    self.navigationItem.leftBarButtonItem = newItemBtn;
    
    //grab device sizes
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenWidth = screenSize.width;
    CGFloat screenHeight = screenSize.height;
    
    self.tableOfThings = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    self.tableOfThings.delegate = self;
    self.tableOfThings.dataSource = self;
    [self.view addSubview:self.tableOfThings];
    self.allThings = [[NSMutableArray alloc] init];
    
}

-(void)createNewThing {
    self.alertForNewName = [[UIAlertView alloc] initWithTitle:@"Enter a New Name" message:@"What do you want to call your object?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Done", nil];
    self.alertForNewName.delegate = self;
    self.alertForNewName.alertViewStyle = UIAlertViewStylePlainTextInput;
    [self.alertForNewName show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString *newThingName = [self.alertForNewName textFieldAtIndex:0].text;
        [self.allThings addObject:newThingName];
        [self.tableOfThings reloadData];
    }
}


#pragma mark Table View Methods

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.allThings removeObjectAtIndex:indexPath.row];
    [self.tableOfThings reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.allThings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    cell.textLabel.text = self.allThings[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdVC *fibVC = [[ThirdVC alloc] init];
    [self.navigationController pushViewController:fibVC animated:YES];
}


@end
