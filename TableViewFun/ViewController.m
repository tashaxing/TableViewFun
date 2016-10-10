//
//  ViewController.m
//  TableViewFun
//
//  Created by yxhe on 16/10/10.
//  Copyright © 2016年 tashaxing. All rights reserved.
//

// ---- 列表实现悬停、索引、折叠 ---- //

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *myTableView; // 列表
    NSArray *sectionTitles; // 每个分区的标题
    NSArray *contentsArray; // 每行的内容
    
    NSMutableArray *isShowArray; // 存储每个section是否展开的bool数组
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
                           @[@"A1",@"A2",@"A3", @"A4", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX"],
                           @[@"B1",@"B2",@"B3",@"B4",@"B5", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX"],
                           @[@"C1",@"C2",@"C3",@"C4",@"C5", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX"],
                           @[@"D1",@"D2",@"D3",@"D4", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX"],
                           @[@"E1",@"E2",@"E3",@"E4", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX", @"XX"],
                           @[@"F1",@"F2", @"XX", @"XX", @"XX", @"XX"],
                           @[@"G1",@"G2",@"G3", @"XX", @"XX"],
                           @[@"H1",@"H2",@"H3", @"XX", @"XX"],
                           nil];
    
    isShowArray = (NSMutableArray *)@[@YES, @YES, @YES, @YES, @YES, @YES, @YES, @YES];
    
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    myTableView.sectionIndexColor = [UIColor purpleColor]; // 右侧索引的颜色
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contentsArray[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerViewId = @"headerViewId";
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewId];
    if (!headerView)
    {
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerViewId];
    }
        
    UIButton *titleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, myTableView.frame.size.width, 30)];
    [titleLabel setBackgroundColor:[UIColor greenColor]];
    titleLabel.text = sectionTitles[section];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:titleLabel];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *detailIndicated = @"tableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:detailIndicated];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailIndicated];
    }
    cell.textLabel.text = contentsArray[indexPath.section][indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 获取点击行的cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // 如果cell已经被标记
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        // 取消标记
        cell.accessoryType  = UITableViewCellAccessoryNone;
    }
    else
    {
        // 如果cell未标记就标记
        cell.accessoryType  = UITableViewCellAccessoryCheckmark;
    }
    
}

// 右侧索引
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionTitles objectAtIndex:section];
}
// 索引目录
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return sectionTitles;
}

// 点击目录
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSLog(@"clicked section: %ld", index);
    // 获取所点目录对应的indexPath值
    NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    
    // 让table滚动到对应的indexPath位置
    [tableView scrollToRowAtIndexPath:selectIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    return index;
}

@end
