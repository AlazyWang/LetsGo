//
//  IWHomeViewController.m
//  01-ItcastWeibo
//
//  Created by apple on 14-1-12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWHomeViewController.h"
#import "UIBarButtonItem+LG.h"

@interface IWHomeViewController ()

@end

@implementation IWHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.view.backgroundColor = LGglobalColor;
    
    // 1.导航条的按钮
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_friendsearch" higlightedImage:@"navigationbar_friendsearch_highlighted" target:self action:@selector(addFriends)];
////    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithName:@"navigationbar_friendsearch"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriends)];
////    [self.navigationItem.leftBarButtonItem setBackgroundImage:[UIImage imageWithName:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//    
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_pop" higlightedImage:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"navigationbar_friendsearch"  selectedImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(addFriends)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:@"navigationbar_pop" selectedImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
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
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = @"测试数据";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *v1 = [[UIViewController alloc]init];
    v1.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:v1 animated:YES];
}



@end
