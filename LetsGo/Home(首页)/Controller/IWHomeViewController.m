//
//  IWHomeViewController.m
//  01-ItcastWeibo
//
//  Created by apple on 14-1-12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWHomeViewController.h"
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

@interface IWHomeViewController () <MJRefreshBaseViewDelegate>
@property (nonatomic,strong)NSMutableArray *arrayOfStatuesFrame;

@property (nonatomic,strong)MJRefreshHeaderView *header;
@property (nonatomic,strong)MJRefreshFooterView *footer;

@end

@implementation IWHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sendStatusRefersh) name:LGSendStatusPostName object:nil];
    
    self.arrayOfStatuesFrame = [NSMutableArray array];
    
    self.view.backgroundColor = LGglobalColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(IWCellMargin, 0, IWCellMargin,0);
    
    [self setupRefrsh];
    
    // 1.导航条的按钮
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_friendsearch" higlightedImage:@"navigationbar_friendsearch_highlighted" target:self action:@selector(addFriends)];
////    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithName:@"navigationbar_friendsearch"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriends)];
////    [self.navigationItem.leftBarButtonItem setBackgroundImage:[UIImage imageWithName:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//    
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_pop" higlightedImage:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"navigationbar_friendsearch"  selectedImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(addFriends)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:@"navigationbar_pop" selectedImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];

    
    
    LGUserInfoParam *param = [[LGUserInfoParam alloc]init];
    param.uid = [LGAccount currentAccount].uid;
    param.access_token = [LGAccount currentAccount].access_token;
    [LGUserTool userInfoParam:param success:^(LGUser *user) {
        self.title = user.name;
        self.tabBarItem.title = @"首页";
    } failure:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnRepeatClick:) name:LGRepeatClickPostName object:nil];
     
}

- (void)sendStatusRefersh
{
    [_header beginRefreshing];
}

- (void)btnRepeatClick:(NSNotification *)nitification
{
    if (nitification.userInfo[LGRepeatKey] == self) {
        [_header beginRefreshing];
    }
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

- (void)dealloc
{
    [_footer free];
    [_header free];
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
    
    LGFriendStatusesParam *param = [[LGFriendStatusesParam alloc]init];
       if (_arrayOfStatuesFrame.count >0) {
        LGStatusFrame *firstStatu = [_arrayOfStatuesFrame lastObject];
        
        long long sinceId = [firstStatu.status.idstr longLongValue] -1;
        param.max_id = @(sinceId);
       }
    param.access_token = [LGAccount currentAccount].access_token;
    
    [LGStatusTool statusesWithAccessParam:param success:^(LGFriendStatusesResult *result) {
        
     
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
    
    
    LGFriendStatusesParam *param = [[LGFriendStatusesParam alloc]init];
    if (_arrayOfStatuesFrame.count >0) {
        LGStatusFrame *firstStatuFrame = _arrayOfStatuesFrame[0];
        
        long long sinceId = [firstStatuFrame.status.idstr longLongValue];
        param.since_id = @(sinceId);
    }
    param.access_token = [LGAccount currentAccount].access_token;
    
    [LGStatusTool statusesWithAccessParam:param success:^(LGFriendStatusesResult *result) {
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
        
        [self showNewStatusesNumber:result.statuses.count];
        
    } failure:^(NSError *error) {
        [_header endRefreshing];
    }];
    
    
 
}

- (void)showNewStatusesNumber:(int)number
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.userInteractionEnabled = NO;
    [btn setBackgroundImage:[UIImage resizeWithName:@"timeline_new_status_background"] forState:UIControlStateNormal];
    if (number == 0) {
        [btn setTitle:[NSString stringWithFormat:@"没有微博"] forState:UIControlStateNormal];
    } else{
        [btn setTitle:[NSString stringWithFormat:@"%d条新微博", number] forState:UIControlStateNormal];
    }
    
    CGFloat btnX = 0;
    CGFloat btnW = self.view.frame.size.width;
    CGFloat btnH = 30.0f;
    CGFloat btnY = 64 - btnH;
    
    btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    [self.navigationController.view insertSubview:btn belowSubview:self.navigationController.navigationBar];
    
    [UIView animateWithDuration:1.0f animations:^{
        btn.transform = CGAffineTransformMakeTranslation(0, btnH);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f delay:1.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
            btn.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [btn removeFromSuperview];
        }];
    }];
    
}
/**
 *  添加朋友
 */
- (void)addFriends
{
    NSLog(@"add friends");
    
}

/**
 *  弹出菜单
 */
- (void)pop
{
    NSLog(@"pop button");
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
