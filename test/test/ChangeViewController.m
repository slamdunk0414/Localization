//
//  ChangeViewController.m
//  cartoon
//
//  Created by funnybean on 2016/10/18.
//  Copyright © 2016年 funnybean. All rights reserved.
//

#import "ChangeViewController.h"
#import "FBLanguageTool.h"
#import "FBLanguageObject.h"

@interface ChangeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tableView;
    
}

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [FBLanguageTool sharedTool].fontsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    FBLanguageObject *object = [FBLanguageTool sharedTool].fontsArray[indexPath.row];
    
    cell.textLabel.text = object.title;
    
    NSString *str = [[FBLanguageTool sharedTool] userLanguage];
    
    if ([object.language isEqualToString:[[FBLanguageTool sharedTool] userLanguage]]) {
        cell.backgroundColor = [UIColor redColor];
    }else{
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FBLanguageObject *object = [FBLanguageTool sharedTool].fontsArray[indexPath.row];
    
    [[FBLanguageTool sharedTool]setUserLanguage:object.language];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [tableView reloadData];
}

@end
