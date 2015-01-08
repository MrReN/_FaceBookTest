//
//  _MainItem.m
//  _FaceBookTest
//
//  Created by 任浩 on 15/1/7.
//  Copyright (c) 2015年 任浩. All rights reserved.
//

#import "_MainItem.h"

@implementation _MainItem

@synthesize imgArray;

-(instancetype)init{
    self=[super init];
    if (self) {
        imgArray=[[NSMutableArray alloc] init];
    }
    return self;
}

@end
