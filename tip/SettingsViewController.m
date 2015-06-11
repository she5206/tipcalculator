//
//  SettingsViewController.m
//  tip
//
//  Created by Man-Chun Hsieh on 6/11/15.
//  Copyright (c) 2015 Man-Chun Hsieh. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *percentControl;

@end

@implementation SettingsViewController

- (void) onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self updatePercent];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updatePercent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updatePercent:(id)sender {
    [self setPercent];
}

- (void) setPercent{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.percentControl.selectedSegmentIndex forKey:@"percent"];
    [defaults synchronize];
}


- (void) updatePercent{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"percent"];
    self.percentControl.selectedSegmentIndex = intValue;
}


@end
