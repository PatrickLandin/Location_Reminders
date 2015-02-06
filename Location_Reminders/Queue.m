//
//  Queue.m
//  Location_Reminders
//
//  Created by Patrick Landin on 2/2/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

#import "Queue.h"

@implementation Queue

-(instancetype)init {
  self = [super init];
  if (self) {
    self.items = [[NSMutableArray alloc] init];
  }
  return self;
}

-(void) enQueue:(NSString *) string {
  [self.items addObject: string];
}

-(NSString *) deQueue:(NSString *) string {
  string = self.items.firstObject;
  [self.items removeObject: string];
  return string;
}

-(NSString *) peekQueue {
  NSString *peekString = [self.items firstObject];
  return peekString;
}

@end
