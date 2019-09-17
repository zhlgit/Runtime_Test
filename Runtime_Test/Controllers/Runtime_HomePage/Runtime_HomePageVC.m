//
//  Runtime_HomePageVC.m
//  RAC_Test
//
//  Created by jielisong on 2019/8/26.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "Runtime_HomePageVC.h"

@interface Runtime_HomePageVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabDemo;

@property (nonatomic, strong) NSArray *aryTitle;

@property (nonatomic, strong) NSArray *aryVCs;

@end

@implementation Runtime_HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tabDemo];
    
    [self.tabDemo registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
}

#pragma mark - Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.aryTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.textLabel.text = self.aryTitle[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [NSClassFromString(self.aryVCs[indexPath.row]) new];
    if (vc) {
        vc.title = self.aryTitle[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - 懒加载

-(NSArray *)aryTitle{
    if (!_aryTitle) {
        _aryTitle = @[@"更改属性值",
                      @"动态添加属性",
                      @"动态添加方法",
                      @"交换方法的实现",
                      @"拦截并替换方法",
                      @"在方法上增加额外功能",
                      @"归档解档",
                      @"字典转模型"];
    }
    return _aryTitle;
}

-(NSArray *)aryVCs{
    if (!_aryVCs) {
        _aryVCs = @[@"Runtime_Sub_FirstVC",
                    @"Runtime_Sub_SecondVC",
                    @"Runtime_Sub_ThirdVC",
                    @"Runtime_Sub_FourthVC",
                    @"Runtime_Sub_FifthVC",
                    @"Runtime_Sub_SixthVC",
                    @"Runtime_Sub_SeventhVC",
                    @"Runtime_Sub_EighthVC"];
    }
    return _aryVCs;
}

-(UITableView *)tabDemo{
    if (!_tabDemo) {
        _tabDemo = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, FrameHeight) style:UITableViewStylePlain];
        _tabDemo.delegate = self;
        _tabDemo.dataSource = self;
    }
    return _tabDemo;
}




@end
