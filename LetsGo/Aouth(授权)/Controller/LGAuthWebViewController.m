//
//  LGAuthWebViewController.m
//  LetsGo
//
//  Created by robert on 14-8-2.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGAuthWebViewController.h"
#import "AFNetworking.h"
#import "LGAccount.h"
#import "LGTabBarController.h"
#import "LGHttpTool.h"
#import "MBProgressHUD+Add.h"

@interface LGAuthWebViewController () <UIWebViewDelegate>
@property (nonatomic, strong) UIWebView* webView;
@end

@implementation LGAuthWebViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    _webView.delegate = self;
    self.view = _webView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //#define IWAppKey @"407425450"
    //#define IWAppSecret @"b1b586217a4e47ba8a208719f8c23fa5"
    //#define IWRedirectURI @"http://www.baidu.com"
    //
    //    // 授权地址
    //#define IWOAuthURLStr [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@&display=mobile", IWAppKey, IWRedirectURI]

    NSString* urlStr = @"https://api.weibo.com/oauth2/authorize?client_id=407425450&redirect_uri=http://www.baidu.com&display=mobile";
    NSURL* url = [NSURL URLWithString:urlStr];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@", request.URL);
    NSRange range = [request.URL.absoluteString rangeOfString:@"code="];
    if (range.length > 0) {
        NSString* code = [request.URL.absoluteString substringFromIndex:range.location + range.length];
        NSLog(@"%@", code);
        [LGAccount getAccessToken:code
                          success:^{
                              self.view.window.rootViewController = [[LGTabBarController alloc]init];
                          } failure:^(NSError *error) {
                              
                          }];

        return NO;
    }

    return YES;
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载中" toView:_webView];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:_webView animated:YES];
}

@end

















