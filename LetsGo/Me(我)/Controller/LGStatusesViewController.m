//
//  LGStatusesViewController.m
//  LetsGo
//
//  Created by robert on 14-8-13.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGStatusesViewController.h"
#import "UIBarButtonItem+LG.h"
#import "LGHttpTool.h"
#import "LGStatusTool.h"
#import "LGAccount.h"
#import "LGUser.h"
#import "LGUserTool.h"
#import "LGFriendStatusesResult.h"
#import "LGFriendStatusesParam.h"
#import "LGUserInfoParam.h"
#import "LGUserTool.h"
#import "MJRefresh.h"
#import "UIImage+LG.h"
#import "LGStatusCell.h"
#import "LGStatusFrame.h"

#import "LGUserStatusesParam.h"

#import "LGUserStatusesResult.h"

@interface LGStatusesViewController ()  <MJRefreshBaseViewDelegate>

@property (nonatomic,strong)NSMutableArray *arrayOfStatuesFrame;

@property (nonatomic,strong)MJRefreshHeaderView *header;
@property (nonatomic,strong)MJRefreshFooterView *footer;

@property (nonatomic,strong)LGUserStatusesResult *result;

@property (nonatomic,strong)LGUserStatusesParam *param;

@end

@implementation LGStatusesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arrayOfStatuesFrame = [NSMutableArray array];
    
    self.view.backgroundColor = LGglobalColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(IWCellMargin, 0, IWCellMargin,0);
    
    [self setupRefrsh];
    
    self.title = @"全部微博";
}



- (void)setupRefrsh
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
    } else
    {
        [self loadNewStatues];
    }
}

- (void)loadMoreStatues
{
    
    LGUserStatusesParam *param = [[LGUserStatusesParam alloc]init];
    if (_arrayOfStatuesFrame.count >0) {
        LGStatusFrame *firstStatu = [_arrayOfStatuesFrame lastObject];
        
        long long sinceId = [firstStatu.status.idstr longLongValue] -1;
        param.max_id = @(sinceId);
    }
    param.access_token = [LGAccount currentAccount].access_token;
    
    _param = param;
    
    [LGStatusTool userStatusesWithParam:param success:^(LGUserStatusesResult *result) {
        
        _result = result;
        for (LGStatus *status in result.statuses) {
            LGStatusFrame *statusFrame = [[LGStatusFrame alloc]init];
            statusFrame.status = status;
            [_arrayOfStatuesFrame addObject:statusFrame];
        }
        
        [self.tableView reloadData];
        [_footer endRefreshing];
        
    } failure:^(NSError *error) {
        [_footer endRefreshing];
    }];
    
}


- (void)loadNewStatues
{
    [UIApplication sharedApplication].applicationIconBadgeNumber -= [self.tabBarItem.badgeValue intValue];
    self.tabBarItem.badgeValue = nil;
    
    LGUserStatusesParam *param = [[LGUserStatusesParam alloc]init];
    if (_arrayOfStatuesFrame.count >0) {
        LGStatusFrame *firstStatuFrame = _arrayOfStatuesFrame[0];
        
        long long sinceId = [firstStatuFrame.status.idstr longLongValue];
        param.since_id = @(sinceId);
    }
    param.access_token = [LGAccount currentAccount].access_token;
    _param = param;
    [LGStatusTool userStatusesWithParam:param success:^(LGUserStatusesResult *result) {
        
        _result =result;
        
        NSMutableArray *newStatuses = [NSMutableArray array];
        
        for (LGStatus *status in result.statuses) {
            LGStatusFrame *statusFrame = [[LGStatusFrame alloc]init];
            statusFrame.status = status;
            [newStatuses addObject:statusFrame];
        }
        
        
        
        [newStatuses addObjectsFromArray:_arrayOfStatuesFrame];
        
        _arrayOfStatuesFrame = newStatuses;
        [self.tableView reloadData];
        [_header endRefreshing];
        
        
    } failure:^(NSError *error) {
        [_header endRefreshing];
    }];
    
    
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_arrayOfStatuesFrame.count >= _result.total_number) {
        _footer.hidden = YES;
    } else {
        _footer.hidden = NO;
    }
    
    return _arrayOfStatuesFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    LGStatusCell *cell = [LGStatusCell cellWithTableView:tableView];
    cell.statusFrame = _arrayOfStatuesFrame[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    UIViewController *v1 = [[UIViewController alloc]init];
    //    v1.view.backgroundColor = [UIColor grayColor];
    //    [self.navigationController pushViewController:v1 animated:YES];
    self.tabBarItem.badgeValue = @"90";
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    return [_arrayOfStatuesFrame[indexPath.row] cellHeight];
}
@end
