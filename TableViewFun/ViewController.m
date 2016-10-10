//
//  ViewController.m
//  TableViewFun
//
//  Created by yxhe on 16/10/10.
//  Copyright © 2016年 tashaxing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *myTableView; // 列表
    NSArray *sectionTitles; // 每个分区的标题
    NSArray *contentsArray; // 每行的内容
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    sectionTitles = [[NSArray alloc] initWithObjects:
                           @"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H", nil];
    contentsArray = [[NSArray alloc] initWithObjects:
                           @[@"A1",@"A2",@"A3", @"A4"],
                           @[@"B1",@"B2",@"B3",@"B4",@"B5"],
                           @[@"C1",@"C2",@"方大同",@"芳芳",@"范伟"],
                           @[@"郭靖",@"郭美美",@"过儿",@"过山车"],
                           @[@"何仙姑",@"和珅",@"郝歌",@"好人"],
                           @[@"妈妈",@"毛毛"],
                           @[@"孙中山",@"沈冰",@"婶婶"],
                           @[@"涛涛",@"淘宝",@"套娃"],
                           @[@"小二",@"夏紫薇",@"许巍",@"许晴"],
                           @[@"周恩来",@"周杰伦",@"张柏芝",@"张大仙"],nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
}

@end
