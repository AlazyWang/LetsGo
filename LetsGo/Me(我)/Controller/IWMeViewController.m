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
#import "LGFriendViewController.h"
#import "LGFollowViewController.h"


@interface IWMeViewController () <LGMeHeadViewDelegate>
@property (nonatomic,strong)LGHeadView *headView;
@property (nonatomic,strong)UIImageView *bgIcon;
@property (nonatomic,assign) CGFloat srollY;
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
    
    
    // 添加一张大图片
    _bgIcon = [[UIImageView alloc]init];
    _bgIcon.image = [UIImage imageNamed:@"profile_cover_background.jpg"];
    _bgIcon.frame = CGRectMake(0 ,0 , 320, 320);
//     _bgIcon.contentMode = UIViewContentModeScaleAspectFill;
    _bgIcon.layer.anchorPoint = CGPointMake(0.5, 0);
    _bgIcon.layer.position = CGPointMake(160, -80);
    [self.tableView insertSubview:_bgIcon atIndex:0];
    
    
    [self loadDate];
 
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= 0) return;
    
    if (offsetY <= -80) {
        CGAffineTransform form = CGAffineTransformMakeTranslation(0, offsetY - _srollY * 0.4);
        CGFloat scale = 1 + ABS(_srollY - offsetY)*0.003;
        _bgIcon.transform = CGAffineTransformScale(form, scale, scale);
    } else {
        _srollY = offsetY;
        CGFloat up = offsetY * 0.6;
        _bgIcon.transform = CGAffineTransformMakeTranslation(0, up);
    }
    
    
//    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY > 0) return;
//    
//    // 1.向上的阻力系数（值越大，阻力越大，向上的力越大）
//    CGFloat upFactor = 0.6;
//    
//    // 2.到什么位置开始放大
//    // value越大，越早放大
//    CGFloat value = 10;
//    CGFloat upMin = - (_bgIcon.frame.size.height / value) / (1 - upFactor);
//    
//    // 3.还没到特定位置，就网上挪动
//    if (offsetY >= upMin) {
//        _bgIcon.transform = CGAffineTransformMakeTranslation(0, offsetY * upFactor);
//    } else {
//        CGAffineTransform transform = CGAffineTransformMakeTranslation(0, offsetY - upMin * (1 - upFactor));
//        CGFloat s = 1 + (upMin - offsetY) * 0.005;
//        _bgIcon.transform = CGAffineTransformScale(transform, s, s);
//    }
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

- (void)headViewFriendsClick:(LGHeadView *)headView
{
    LGFriendViewController *statusViewController = [[LGFriendViewController alloc]init];
    [self.navigationController pushViewController:statusViewController animated:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (void)headViewFollowerClick:(LGHeadView *)headView
{
    LGFollowViewController *statusViewController = [[LGFollowViewController alloc]init];
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
