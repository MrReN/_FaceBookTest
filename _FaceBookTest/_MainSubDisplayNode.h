//
//  _MainSubDisplayNode.h
//  _FaceBookTest
//
//  Created by 任浩 on 15/1/7.
//  Copyright (c) 2015年 任浩. All rights reserved.
//

#import "ASDisplayNode.h"
#import <ASNetworkImageNode.h>
#import <UIImageView+WebCache.h>
@interface _MainSubDisplayNode : ASDisplayNode

@property (nonatomic,strong)NSMutableArray * imageArray;

-(void)calculateImagePositionMethod:(NSMutableArray *)dataArray  IsCheck:(BOOL)isCheck;

-(CGFloat)subViewHeight:(int)count;
-(void)NetWork:(int)count IsCheck:(BOOL)isCheck Array:(NSMutableArray *)dataArray;
@end
