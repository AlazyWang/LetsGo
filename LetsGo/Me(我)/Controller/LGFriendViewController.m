//
//  LGFriendViewController.m
//  LetsGo
//
//  Created by robert on 14-8-14.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGFriendViewController.h"

#import "LGfriendParam.h"
#import "LGfriendResult.h"
#import "LGFriendShipCell.h"
#import "LGFriendshipTool.h"

#import "MJRefresh.h"


@interface LGFriendViewController () <MJRefreshBaseViewDelegate>
@property (nonatomic,strong)NSMutableArray *friendships;
@property (nonatomic,strong)MJRefreshHeaderView *header;
@property (nonatomic,strong)MJRefreshFooterView *footer;
@property (nonatomic,strong)LGfriendResult *result;
@end

@implementation LGFriendViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self.tableView setRowHeight:[LGFriendShipCell cellWithTableView:self.tableView].frame.size.height];
    [self setupRefresh];

}

- (void)setupRefresh
{
    _header = [MJRefreshHeaderView header];
    _header.delegate = self;
    _header.scrollView = self.tableView;
    
    [_header beginRefreshing];
    
    
    _footer = [MJRefreshFooterView footer];
    _footer.delegate = self;
    _footer.scrollView = self.tableView;
    
}

- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if ([refreshView isKindOfClass:[MJRefreshFooterView class]]) {
        [self loadMoreStatues];
    } else{
        [self loadNewStatues];
    }
}

- (void)loadMoreStatues
{
    LGfriendParam *param = [[LGfriendParam alloc]init];
    
    param.cursor = @(_result.next_cursor);
    [LGFriendshipTool friendWithParam:param success:^(LGfriendResult *result) {
        _result = result;
        
        [_friendships addObjectsFromArray:result.users];
        
        [self.tableView reloadData];
        
        [_footer endRefreshing];
    } failure:^(NSError *error) {
        [_footer endRefreshing];
    }];
}

- (void)loadNewStatues
{
    LGfriendParam *param = [[LGfriendParam alloc]init];
    
    param.cursor = @(_result.previous_cursor);
    [LGFriendshipTool friendWithParam:param success:^(LGfriendResult *result) {
        _result = result;
        NSMutableArray *newData = [NSMutableArray array];
        
        
        [newData addObjectsFromArray:result.users];
        [newData addObjectsFromArray:_friendships];
        _friendships = newData;
        
        [self.tableView reloadData];
        
        [_header endRefreshing];
        _header.hidden = YES;
    } failure:^(NSError *error) {
        [_footer endRefreshing];
    }];
}

- (void)dealloc
{
    [_header free];
    [_footer free];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    if (_result.next_cursor == 0) {
        _footer.hidden = YES;
    } else
    {
        _footer.hidden = NO;
    }
    return _friendships.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LGFriendShipCell *cell = [LGFriendShipCell cellWithTableView:tableView];
    cell.user = _friendships[indexPath.row];
    return cell;
}


@end
