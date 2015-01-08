//
//  ViewController.h
//  _FaceBookTest
//
//  Created by 任浩 on 15/1/6.
//  Copyright (c) 2015年 任浩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AsyncDisplayKit.h>
#import "_MainCellNode.h"
#import <AFNetworking.h>
#import "_MainItem.h"
#import "_HandleString.h"
#import <UIImageView+WebCache.h>

@interface ViewController : UIViewController<ASTableViewDataSource,ASTableViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong)ASTableView * tableView;
@property (nonatomic,strong)NSMutableArray * dataArray;
@property (nonatomic,strong)UIRefreshControl * refreshControl;
@property (nonatomic)int page;
@property (nonatomic)int indexRow;
@property (nonatomic,strong)NSMutableArray * nodeArray;
@property (nonatomic,strong)NSMutableArray * indexArray;
@end

