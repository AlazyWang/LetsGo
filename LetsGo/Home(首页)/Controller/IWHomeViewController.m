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

@interface IWHomeViewController ()
@property (nonatomic,strong)NSArray *arrayOfStatues;
@end

@implementation IWHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arrayOfStatues = [NSArray array];
    
    self.view.backgroundColor = LGglobalColor;
    
    // 1.导航条的按钮
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_friendsearch" higlightedImage:@"navigationbar_friendsearch_highlighted" target:self action:@selector(addFriends)];
////    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithName:@"navigationbar_friendsearch"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriends)];
////    [self.navigationItem.leftBarButtonItem setBackgroundImage:[UIImage imageWithName:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//    
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_pop" higlightedImage:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"navigationbar_friendsearch"  selectedImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(addFriends)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:@"navigationbar_pop" selectedImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
//    [LGStatusTool statusesWithAccessToken:[LGAccount currentAccount].access_token success:^(NSArray *status) {
//        self.arrayOfStatues = status;
//        [self.tableView reloadData];
//        
//    } failure:^(NSError *error) {
//        
//    }];
    LGFriendStatusesParam *result = [[LGFriendStatusesParam alloc]init];
    result.access_token = [LGAccount currentAccount].access_token;
    [LGStatusTool statusesWithAccessParam:result success:^(LGFriendStatusesResult *result) {
        self.arrayOfStatues = result.statuses;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    
    LGUserInfoParam *param = [[LGUserInfoParam alloc]init];
    param.uid = [LGAccount currentAccount].uid;
    param.access_token = [LGAccount currentAccount].access_token;
    [LGUserTool userInfoParam:param success:^(LGUser *user) {
        self.title = user.name;
        self.tabBarItem.title = @"首页";
    } failure:nil];
    
     
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
    return _arrayOfStatues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    LGStatus *status = (LGStatus *)_arrayOfStatues[indexPath.row];
    cell.textLabel.text = status.text;
 
    
    cell.detailTextLabel.text = status.user.desc;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UIViewController *v1 = [[UIViewController alloc]init];
//    v1.view.backgroundColor = [UIColor grayColor];
//    [self.navigationController pushViewController:v1 animated:YES];
    self.tabBarItem.badgeValue = @"90";
}



@end
