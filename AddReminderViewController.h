//
//  AddReminderViewController.h
//  Location_Reminders
//
//  Created by Patrick Landin on 2/4/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AddReminderViewController : UIViewController

@property (strong,nonatomic) MKPointAnnotation *annotation;
@property (strong,nonatomic) CLLocationManager *locationManager;

@end