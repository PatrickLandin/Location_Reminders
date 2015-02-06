//
//  MapInterfaceController.m
//  Location_Reminders
//
//  Created by Patrick Landin on 2/5/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

#import "MapInterfaceController.h"

@interface MapInterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceMap *map;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation MapInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
  
  CLLocationManager *locationManager = [CLLocationManager new];
  NSSet *regions = locationManager.monitoredRegions;
  NSArray *regionsArray = regions.allObjects;
  
  NSInteger index = 0;
//  
//  for (MKCoordinate *region in regionsArray) {
//    ReminderRowController *rowController = [self.map rowControllerAtIndex:index];
//    [MapInterfaceController.map setText:region.identifier];
//    index++;
//  }
//  
//  MKCoordinateRegion region = MKCoordinateRegionMake(self.regions.center, MKCoordinateSpanMake(0.03, 0.03));
//  [self.mapView setRegion:region];
//  

    // Configure interface objects here.
}

//-(NSArray *)contextsForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
//  
//  
//  return 
//}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



