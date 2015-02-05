//
//  MapViewController.m
//  Location_Reminders
//
//  Created by Patrick Landin on 2/2/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AddReminderViewController.h"

@interface MapViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) MKPointAnnotation *selectedAnnotation;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reminderAdded:) name:@"ReminderAdded" object:nil];
  
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.mapView.delegate = self;
    self.mapView.rotateEnabled = false;
  
  if ([CLLocationManager locationServicesEnabled]) {
    
    NSLog(@"Current location status is %d", [CLLocationManager authorizationStatus]);
  
    if ([CLLocationManager authorizationStatus] == 0) {
      [self.locationManager requestAlwaysAuthorization];
  
    } else {
      self.mapView.showsUserLocation = TRUE;
      [self.locationManager startMonitoringSignificantLocationChanges];
    }
    
  } else {
    // Maybe warn the user that location services are not enabled and app will therefore by rubbish
  }
  
  UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(mapLongPressed:)];
  [self.mapView addGestureRecognizer:longPress];
  
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) reminderAdded:(NSNotification *)notification {
  NSLog(@"reminder notification");
  NSDictionary *userInfo = notification.userInfo;
  CLCircularRegion *region = userInfo[@"reminder"];
//  NSString *notificationName = notification.name;
  
  MKCircle *circleOverlay = [MKCircle circleWithCenterCoordinate:region.center radius:region.radius];
  
  [self.mapView addOverlay:circleOverlay];
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
  MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
  circleRenderer.fillColor = [UIColor blueColor];
  circleRenderer.strokeColor = [UIColor redColor];
  circleRenderer.alpha = 0.12;
  return circleRenderer;
}

-(void)mapLongPressed:(id)sender {
  
  UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
  NSLog(@"long press fired");
  if (longPress.state == 3) {
    CGPoint location = [longPress locationInView:self.mapView];
    NSLog(@"location y: %f location x: %f",location.y, location.x);
    CLLocationCoordinate2D coordinates = [self.mapView convertPoint:location toCoordinateFromView:self.mapView];
    NSLog(@"coordinate long: %f coordinate lat x: %f",coordinates.longitude, coordinates.latitude);
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = coordinates;
    annotation.title = @"This is a place";
    [self.mapView addAnnotation:annotation];
  }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
  NSLog(@" the new status is %d", status);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  CLLocation *location = locations.firstObject;
  NSLog(@"latitide: %f and longitude: %f",location.coordinate.latitude, location.coordinate.longitude);
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  MKPinAnnotationView *annotationView =  [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];
  annotationView.animatesDrop = TRUE;
  annotationView.pinColor = MKPinAnnotationColorPurple;
  annotationView.canShowCallout = TRUE;
  annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
  
  return annotationView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
  self.selectedAnnotation = view.annotation;
  [self performSegueWithIdentifier:@"SHOW_DETAIL" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"SHOW_DETAIL"]) {
    AddReminderViewController *addReminderVC = (AddReminderViewController *)segue.destinationViewController;
    addReminderVC.annotation = self.selectedAnnotation;
    addReminderVC.locationManager = self.locationManager;
  }
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
  NSLog(@"Region entered");
  UILocalNotification *localNotification = [[UILocalNotification alloc] init];
  localNotification.alertBody = @"You've entered a region of importance!";
  localNotification.alertAction = @"Region Action";
  
  [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
}

- (IBAction)middleButtonPressed:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude =  47.863475, .longitude =  -122.208951};
  MKCoordinateSpan span = {.latitudeDelta =  0.03, .longitudeDelta =  0.03};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated: TRUE];
}

- (IBAction)leftButtonPressed:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude =  42.999546, .longitude =  6.171138};
  MKCoordinateSpan span = {.latitudeDelta =  0.2, .longitudeDelta =  0.06};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated: TRUE];
}

- (IBAction)rightButtonPressed:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude = 51.118769, .longitude =  -0.535775};
  MKCoordinateSpan span = {.latitudeDelta =  0.04, .longitudeDelta =  0.04};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated: TRUE];
}

-(void) dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end