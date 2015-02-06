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
@property (strong, nonatomic) NSArray *regionsArray;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
  
  CLLocationManager *locationManager = [CLLocationManager new];
  NSSet *regions = locationManager.monitoredRegions;
  self.regionsArray = regions.allObjects;
  
  [self.table setNumberOfRows:regions.count withRowType:@"ReminderRowController"];
  NSInteger index = 0;
  for (CLCircularRegion *region in self.regionsArray) {
    ReminderRowController *rowController = [self.table rowControllerAtIndex:index];
    [rowController.reminderLabel setText:region.identifier];
    index++;
  }
    // Configure interface objects here.
}

-(id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
  return self.regionsArray[rowIndex];
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



