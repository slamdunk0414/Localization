//
//  ViewController.m
//  test
//
//  Created by funnybean on 2016/10/18.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
#import "FBLanguageButton.h"
#import "ChangeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    FBLanguageButton *button = [[FBLanguageButton alloc]initWithFrame:CGRectMake(0, 80, 100, 100)];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.localTitle = @"button";
    
    [self.view addSubview:button];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ChangeViewController *controller = [[ChangeViewController alloc]init];
    
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
