//
//  Stack.m
//  Location_Reminders
//
//  Created by Patrick Landin on 2/2/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

#import "Stack.h"

@implementation Stack

-(instancetype)init {
  self = [super init];
  if (self) {
    self.items = [[NSMutableArray alloc] init];
  }
  return self;
}

-(void) pushString:(NSString*) string {
  [self.items addObject: string];
}

-(NSString *) popString {
  NSString *lastItem = self.items.lastObject;
  [self.items removeLastObject];
  return lastItem;
}

-(NSString *) peekStack {
  NSString *lastItem = self.items.lastObject;
  return lastItem;
}

@end
