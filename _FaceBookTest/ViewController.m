//
//  ViewController.m
//  _FaceBookTest
//
//  Created by 任浩 on 15/1/6.
//  Copyright (c) 2015年 任浩. All rights reserved.
//
#define navHeight 0
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tableView=_tableView;
@synthesize dataArray;
@synthesize refreshControl;
@synthesize page;
@synthesize indexRow;
@synthesize nodeArray;
@synthesize indexArray;


- (void)viewDidLoad {
    
    page=2;
    _tableView=[[ASTableView alloc] initWithFrame:CGRectMake(0, navHeight, self.view.frame.size.width, self.view.frame.size.height-navHeight) style:UITableViewStyleGrouped];
    _tableView.asyncDataSource=self;
    _tableView.asyncDelegate=self;
//    _tableView.tag=10003;
    refreshControl=[[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshMethod) forControlEvents:UIControlEventValueChanged];
    [_tableView addSubview:refreshControl];

    dataArray=[[NSMutableArray alloc] init];
    nodeArray=[[NSMutableArray alloc] init];
    indexArray=[[NSMutableArray alloc] init];
    
    
    
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    NSString * strUrl=[NSString stringWithFormat:@"https://api.weibo.com/2/statuses/friends_timeline.json?access_token=2.00T9QaOEyY87OCdcca61dc210aVY_e"];
//    NSLog(@"strurl is %@",strUrl);
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response is %@",responseObject);
        for (NSDictionary * dict in [responseObject objectForKey:@"statuses"]) {
            _MainItem * item=[[_MainItem alloc] init];
            item.text=[_HandleString handleStringMethod:[dict objectForKey:@"text"] Font:15];
            item.imgArray=[dict objectForKey:@"pic_urls"];
            NSDictionary * userDict=[dict objectForKey:@"user"];
            item.userName=[_HandleString handleStringMethod:[userDict objectForKey:@"name"]Font:15];
            item.avator=[userDict objectForKey:@"avatar_large"];
            item.commentCount=[dict objectForKey:@"comments_count"];
            item.zanCount=[dict objectForKey:@"reposts_count"];
            item.time=[_HandleString handleStringMethod:[dict objectForKey:@"created_at"]Font:12];
            [dataArray addObject:item];
            
        }
        indexRow=(int)[dataArray count]-1;
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    UIView * headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    headerView.backgroundColor=[UIColor redColor];
    _tableView.tableHeaderView=headerView;
    
    UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 320, 40);
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(footRefreshMethod) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"onclick reload" forState:UIControlStateNormal];
    _tableView.tableFooterView=button;
    
    [self.view addSubview:_tableView];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)footRefreshMethod{
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    NSString * strUrl=[NSString stringWithFormat:@"https://api.weibo.com/2/statuses/friends_timeline.json?access_token=2.00T9QaOEyY87OCdcca61dc210aVY_e&page=%d",page];
    //    NSLog(@"strurl is %@",strUrl);
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response is %@",responseObject);
        for (NSDictionary * dict in [responseObject objectForKey:@"statuses"]) {
            _MainItem * item=[[_MainItem alloc] init];
            item.text=[_HandleString handleStringMethod:[dict objectForKey:@"text"] Font:15];
            item.imgArray=[dict objectForKey:@"pic_urls"];
            NSDictionary * userDict=[dict objectForKey:@"user"];
            item.userName=[_HandleString handleStringMethod:[userDict objectForKey:@"name"]Font:15];
            item.avator=[userDict objectForKey:@"avatar_large"];
            item.commentCount=[dict objectForKey:@"comments_count"];
            item.zanCount=[dict objectForKey:@"reposts_count"];
            item.time=[_HandleString handleStringMethod:[dict objectForKey:@"created_at"]Font:12];
            [dataArray addObject:item];
        }
        page++;
        NSMutableArray * array=[[NSMutableArray alloc] init];
              for (int i=indexRow+1; i<[dataArray count]; i++) {
            NSIndexPath * indexPath=[NSIndexPath indexPathForRow:i inSection:0];
            [array addObject:indexPath];
        }
      
       [_tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
        indexRow=(int)[dataArray count]-1;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

-(void)refreshMethod{
//    sleep(3);
    [refreshControl endRefreshing];
}


-(ASCellNode *)tableView:(ASTableView *)tableView nodeForRowAtIndexPath:(NSIndexPath *)indexPath{
    _MainItem * item=[dataArray objectAtIndex:indexPath.row];
    _MainCellNode * cellNode=[[_MainCellNode alloc] initImageUrls:item.avator Text:item.text ImagesUrl:item.imgArray UserName:item.userName Time:item.time];
    cellNode.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    return cellNode;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"onclick indexpath row is %d",(int)indexPath.row);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
