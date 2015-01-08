//
//  _MainCellNode.h
//  _FaceBookTest
//
//  Created by 任浩 on 15/1/7.
//  Copyright (c) 2015年 任浩. All rights reserved.
//

#import "ASCellNode.h"
#import <AsyncDisplayKit.h>
#import "_MainSubDisplayNode.h"
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>

@interface _MainCellNode : ASCellNode

//@property (nonatomic,strong)
@property (nonatomic,strong)ASNetworkImageNode * netImageNode;
@property (nonatomic,strong)ASTextNode * userNameNode;
@property (nonatomic,strong)ASTextNode * timeNode;
@property (nonatomic,strong)ASTextNode * textNode;
@property (nonatomic,strong)_MainSubDisplayNode * subDisplayNode;
@property (nonatomic,strong)NSMutableArray * imageArray;
@property (nonatomic)CGFloat height;
@property (nonatomic)int tag;
@property (nonatomic)BOOL isCheck;
-(id)initImageUrls:(NSString *)imageUrl Text:(NSAttributedString *)text ImagesUrl:(NSMutableArray *)array UserName:(NSAttributedString *)userName Time:(NSAttributedString *)time;



@end
