//
//  _MainSubDisplayNode.m
//  _FaceBookTest
//
//  Created by 任浩 on 15/1/7.
//  Copyright (c) 2015年 任浩. All rights reserved.
//

#import "_MainSubDisplayNode.h"

@implementation _MainSubDisplayNode

@synthesize imageArray;

-(id)init{
    self=[super init];
    if (self) {
        imageArray=[[NSMutableArray alloc] init];
            }
    return self;
}

-(void)calculateImagePositionMethod:(NSMutableArray *)dataArray IsCheck:(BOOL)isCheck{
    int count=[dataArray count];
    CGFloat width=60;
    for (int i=0; i<[dataArray count]; i++) {
        ASNetworkImageNode * netImageNode=[[ASNetworkImageNode alloc] init];
//        netImageNode.image=[UIImage imageNamed:@""];
        netImageNode.backgroundColor=[UIColor grayColor];
        [imageArray addObject:netImageNode];
    }

    if (count!=0) {
            for (int i=0; i<count; i++) {
                ASNetworkImageNode * imageNode=[imageArray objectAtIndex:i];
                imageNode.URL=[NSURL URLWithString:[[dataArray objectAtIndex:i] objectForKey:@"thumbnail_pic"]] ;
                imageNode.frame=CGRectMake(i%3*(width+10), i/3*(width+10), width, width);
                [self addSubnode:imageNode];
                
    }
}
}



-(CGFloat)subViewHeight:(int)count{
    if (count!=0) {
        if (count<4) {
            return 70;
        }
        else if(count<7){
            return 140;
        }
        else if(count<10){
            return 210;
        }
        
    }
    return 0;
}

@end
