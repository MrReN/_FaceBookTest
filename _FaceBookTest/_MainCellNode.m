//
//  _MainCellNode.m
//  _FaceBookTest
//
//  Created by 任浩 on 15/1/7.
//  Copyright (c) 2015年 任浩. All rights reserved.
//

#import "_MainCellNode.h"

@implementation _MainCellNode
@synthesize userNameNode;
@synthesize timeNode;
@synthesize netImageNode;
@synthesize textNode;
@synthesize subDisplayNode;
@synthesize imageArray;
@synthesize height;
@synthesize tag;
@synthesize isCheck;

-(id)init{
    self=[super init];
    if (self) {
    }
    return self;
}

-(id)initImageUrls:(NSString *)imageUrl Text:(NSAttributedString *)text ImagesUrl:(NSMutableArray *)array UserName:(NSAttributedString *)userName Time:(NSAttributedString *)time{
    self=[super init];
    if (self) {
        netImageNode=[[ASNetworkImageNode alloc] init];
        netImageNode.URL=[NSURL URLWithString:imageUrl];
        [self addSubnode:netImageNode];
        userNameNode=[[ASTextNode alloc] init];
        userNameNode.attributedString=userName;
        [self addSubnode:userNameNode];
        
        timeNode=[[ASTextNode alloc] init];
        timeNode.attributedString=time;
        [self addSubnode:timeNode];
        
        textNode=[[ASTextNode alloc] init];
        textNode.attributedString=text;
        [self addSubnode:textNode];
        
        subDisplayNode=[[_MainSubDisplayNode alloc] init];
        [subDisplayNode calculateImagePositionMethod:array IsCheck:isCheck];
        height= [subDisplayNode subViewHeight:[array count]];
//        subDisplayNode.backgroundColor=[UIColor redColor];
        [self addSubnode:subDisplayNode];
        imageArray=array;
    }
    return self;
}

-(CGSize)calculateSizeThatFits:(CGSize)constrainedSize{
    CGSize textSize = [textNode measure:CGSizeMake(300, 1000)];

    return CGSizeMake(self.frame.size.width, 70+textSize.height+height);
}
-(void)layout{
    netImageNode.frame=CGRectMake(10, 10, 40, 40);
    netImageNode.layer.masksToBounds=YES;
    netImageNode.layer.cornerRadius=netImageNode.frame.size.width/2.0;
    userNameNode.frame=CGRectMake(70, 10, 200, 20);
    timeNode.frame=CGRectMake(70, 30, 200, 20);
    
    CGSize size=textNode.calculatedSize;
    textNode.frame=CGRectMake(10, netImageNode.frame.origin.y+netImageNode.frame.size.height+10, size.width, size.height);
    subDisplayNode.frame=CGRectMake(10, textNode.frame.origin.y+textNode.frame.size.height+10, 300, height);
    
    
//    userNameNode.attributedString=[];
}





@end
