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

@interface MapViewController () <CLLocationManagerDelegate, MKMapViewDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

-(void)mapLongPressed:(id)sender {
  
  UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
  NSLog(@"long press fired");
  if (longPress.state == 3) {
    CGPoint location = [longPress locationInView:self.mapView];
    CLLocationCoordinate2D coordinates = [self.mapView convertPoint:location toCoordinateFromView:self.mapView];
    
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
  MKPinAnnotationView *annotationView =  [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
  annotationView.animatesDrop = TRUE;
  annotationView.pinColor = MKPinAnnotationColorPurple;
  annotationView.canShowCallout = TRUE;
  annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
  
  return annotationView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
//  MKPointAnnotation *annotation = view.annotation;
  
  [self performSegueWithIdentifier:@"SHOW_DETAIL" sender:self];
}

- (IBAction)middleButtonPressed:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude =  47.863475, .longitude =  -122.208951};
  MKCoordinateSpan span = {.latitudeDelta =  0.03, .longitudeDelta =  0.03};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated: TRUE];
}

- (IBAction)leftButtonPressed:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude =  42.999546, .longitude =  6.171138};
  MKCoordinateSpan span = {.latitudeDelta =  0.06, .longitudeDelta =  0.06};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated: TRUE];
}

- (IBAction)rightButtonPressed:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude = 51.118769, .longitude =  -0.535775};
  MKCoordinateSpan span = {.latitudeDelta =  0.04, .longitudeDelta =  0.04};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated: TRUE];
}

@end