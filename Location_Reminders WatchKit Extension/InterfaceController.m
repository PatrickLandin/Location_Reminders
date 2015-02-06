//
//  InterfaceController.m
//  Location_Reminders WatchKit Extension
//
//  Created by Patrick Landin on 2/5/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

#import "InterfaceController.h"
#import "ReminderRowController.h"
#import <CoreLocation/CoreLocation.h>


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
  
  CLLocationManager *locationManager = [CLLocationManager new];
  NSSet *regions = locationManager.monitoredRegions;
  NSArray *regionsArray = regions.allObjects;
  [self.table setNumberOfRows:regionsArray.count withRowType:@"ReminderRowController"];
  
  NSInteger index = 0;
  
  for (CLCircularRegion *region in regionsArray) {
    ReminderRowController *rowController = [self.table rowControllerAtIndex:index];
    [rowController.reminderLabel setText:region.identifier];
    index++;
  }
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



