//
//  LGSendViewController.m
//  LetsGo
//
//  Created by robert on 14-8-10.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGSendViewController.h"
#import "LGTextView.h"
#import "LGStatusTool.h"
#import "LGSendParam.h"
#import "MBProgressHUD+Add.h"

@interface LGSendViewController ()
@property (nonatomic,strong)LGTextView *textView;
@end

@implementation LGSendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = LGglobalColor;
    
    self.title = @"发微博";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(navCancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(navDone)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    
    LGTextView *textView = [[LGTextView alloc]init];
    textView.frame = CGRectMake(0, 0, self.view.frame.size.width, 250);
    textView.backgroundColor = [UIColor whiteColor];
    
    textView.font = [UIFont systemFontOfSize:14.0];
    textView.placeholder = @"请在此输入文字";
    [self.view addSubview:textView];
    _textView = textView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewHasChange) name:UITextViewTextDidChangeNotification object:textView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textViewHasChange
{
    self.navigationItem.rightBarButtonItem.enabled = _textView.text.length>0?1:0;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)navDone

{
    LGSendParam *param = [[LGSendParam alloc]init];
    param.status = _textView.text;
    
    [LGStatusTool sendStatusParam:param success:^(LGUser *status) {
        [MBProgressHUD showSuccess:@"发送成功" toView:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:LGSendStatusPostName object:nil userInfo:nil];
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"发送失败" toView:nil];
        
    }];
    [self navCancel];
    
  
}

- (void)navCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
