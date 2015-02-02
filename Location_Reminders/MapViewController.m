//
//  MapViewController.m
//  Location_Reminders
//
//  Created by Patrick Landin on 2/2/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
//  self.mapView.delegate = self;
  self.mapView.rotateEnabled = false;
  
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)middleButtonPressed:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude =  47.863475, .longitude =  -122.208951};
  MKCoordinateSpan span = {.latitudeDelta =  0.02, .longitudeDelta =  0.02};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated: TRUE];
}

- (IBAction)leftButtonPressed:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude =  42.999546, .longitude =  6.171138};
  MKCoordinateSpan span = {.latitudeDelta =  0.02, .longitudeDelta =  0.02};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated: TRUE];
}

- (IBAction)rightButtonPressed:(UIButton *)sender {
  CLLocationCoordinate2D coordinates = {.latitude = 51.118769, .longitude =  -0.535775};
  MKCoordinateSpan span = {.latitudeDelta =  0.02, .longitudeDelta =  0.02};
  MKCoordinateRegion region = {coordinates, span};
  [self.mapView setRegion:region animated: TRUE];
}

@end