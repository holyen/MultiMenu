//
//  MyItem.m
//  MultiMenu
//
//  Created by gaogao on 1/28/13.
//  Copyright (c) 2013 lxm. All rights reserved.
//

#import "MyItem.h"

@implementation MyItem


@synthesize subItems;
@synthesize title;
@synthesize level = _level;


@synthesize isSubItemOpen = _isSubItemOpen;
@synthesize isSubCascadeOpen = _isSubCascadeOpen;

-(id) init
{
    
    self = [super init];
    
    if (self) {

        
    }
    
    return  self;

}

- (void)dealloc
{
    [title release];
    [subItems release];

    
    
    [super dealloc];
}



- (NSString *)description
{
    NSString *des;
    des = [super description];
    NSLog(@"%@",title);
    return des;
}
@end
