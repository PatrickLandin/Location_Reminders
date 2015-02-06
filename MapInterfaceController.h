//
//  MapInterfaceController.h
//  Location_Reminders
//
//  Created by Patrick Landin on 2/5/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapInterfaceController : WKInterfaceController

@property (strong, nonatomic) CLCircularRegion *currentRegion;

@end
