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

@end

@implementation MapInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
  
  self.currentRegion = context;
  MKCoordinateRegion region = MKCoordinateRegionMake(self.currentRegion.center, MKCoordinateSpanMake(.015, .015));
  [self.map setRegion:region];

//     Configure interface objects here.
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



