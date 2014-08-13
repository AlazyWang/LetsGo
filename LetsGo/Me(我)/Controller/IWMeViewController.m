//
//  IWMeViewController.m
//  01-ItcastWeibo
//
//  Created by apple on 14-1-12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWMeViewController.h"
#import "LGHeadView.h"
#import "LGStatusTool.h"
#import "LGUserTool.h"
#import "LGStatus.h"
#import "MJExtension.h"

#import "LGUserInfoParam.h"
#import "LGStatusesViewController.h"


@interface IWMeViewController () <LGMeHeadViewDelegate>
@property (nonatomic,strong)LGHeadView *headView;
@end

@implementation IWMeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sendStatusRefersh) name:LGSendStatusPostName object:nil];
     self.view.backgroundColor = LGglobalColor;
    
     [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    LGHeadView *headView = [LGHeadView header];
    headView.delegate = self;
    self.tableView.tableHeaderView = headView;
    _headView = headView;
    
    [self loadDate];
 
}

- (void)loadDate
{
    // 加载数据
    
    LGUserInfoParam *param = [[LGUserInfoParam alloc]init];
    
    //    NSDictionary *params = param.keyValues;
    
    [LGUserTool userInfoParam:param success:^(LGUser *user) {
        _headView.user = user;
    } failure:^(NSError *error) {
        
    }];
}

- (void)sendStatusRefersh
{
    [self loadDate];
}

- (void)viewDidAppear:(BOOL)animated{}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)headViewWeiboClick:(LGHeadView *)headView
{
    LGStatusesViewController *statusViewController = [[LGStatusesViewController alloc]init];
    [self.navigationController pushViewController:statusViewController animated:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = @"测试数据--me";
    
    return cell;
}



@end
