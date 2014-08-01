//
//  IWSqaureViewController.m
//  01-ItcastWeibo
//
//  Created by apple on 14-1-12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWSqaureViewController.h"
#import "LGSearch.h"

@interface IWSqaureViewController ()<UITextFieldDelegate>

@end

@implementation IWSqaureViewController

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
	// Do any additional setup after loading the view.
     self.view.backgroundColor = LGglobalColor;
    
    LGSearch *search = [[LGSearch alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    search.delegate = self;
    
    self.navigationItem.titleView = search;
    
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view.window endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}


@end
