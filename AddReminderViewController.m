//
//  AddReminderViewController.m
//  Location_Reminders
//
//  Created by Patrick Landin on 2/4/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

#import "AddReminderViewController.h"

@interface AddReminderViewController ()
@property (weak, nonatomic) IBOutlet UITextField *newReminderText;

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  NSLog(@" long: %f lat: %f", self.annotation.coordinate.longitude, self.annotation.coordinate.latitude);
    // Do any additional setup after loading the view.
}

- (IBAction)addReminderPressed:(id)sender {
  if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:self.annotation.coordinate radius:1000 identifier:@"Reminder"];
    [self.locationManager startMonitoringForRegion:region];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReminderAdded" object:self userInfo:@{@"reminder" : region}];
  }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end