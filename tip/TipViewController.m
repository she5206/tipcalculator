//
//  TipViewController.m
//  tip
//
//  Created by Man-Chun Hsieh on 6/11/15.
//  Copyright (c) 2015 Man-Chun Hsieh. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tipText;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipBtn;
- (IBAction)onTap:(id)sender;
- (void) updateMoney;
- (IBAction)onMove:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *outlet;

@end

@implementation TipViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    if(self){
        self.title = @"Tip Calculator";
    }
    return self;

}

- (void)viewWillAppear:(BOOL)animated {
    [self updatePercent];
    [self updateMoney];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateMoney];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    [self updatePercent];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateMoney];
}

- (void) updatePercent{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"percent"];
    self.tipBtn.selectedSegmentIndex = intValue;
}

- (void) updateMoney{
    float input = [self.tipText.text floatValue];
    
    NSArray *percent = @[@(0.1),@(0.15),@(0.2)];
    
    float tipamount= input * [percent[self.tipBtn.selectedSegmentIndex] floatValue];
    
    float totalamount= input + tipamount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipamount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalamount];

}

- (IBAction)onMove:(id)sender {
    //self.outlet.backgroundColor = [UIColor blueColor];
    CGFloat red =  (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    self.outlet.backgroundColor =[UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

@end
