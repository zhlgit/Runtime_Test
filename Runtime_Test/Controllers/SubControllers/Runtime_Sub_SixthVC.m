//
//  Runtime_Sub_SixthVC.m
//  RAC_Test
//
//  Created by jielisong on 2019/9/10.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "Runtime_Sub_SixthVC.h"
#import "CountButton.h"

@interface Runtime_Sub_SixthVC ()

@property (nonatomic, strong) CountButton *testButton;

@end

@implementation Runtime_Sub_SixthVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)initView{
    [super initView];
    [self.view addSubview:self.testButton];
}

-(NSArray *)buttonTitleArray{
    return @[@"这",@"几",@"个",@"按",@"钮",@"不",@"统",@"计"];
}

-(void)buttonClick:(UIButton *)sender{
    self.strTest = @"此按钮不统计点击次数";
}

- (void)countButtonClick:(UIButton *)sender {
    self.strTest = [NSString stringWithFormat:@"点击%@次了",@(self.testButton.count)];
}

-(CountButton *)testButton{
    if (!_testButton) {
        _testButton = [CountButton buttonWithType:UIButtonTypeCustom];
        [_testButton addTarget:self action:@selector(countButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_testButton setTitle:@"统计此按钮的点击数量" forState:UIControlStateNormal];
        _testButton.frame = CGRectMake(20, self.view.center.y + 100, ScreenWidth - 40, 30);
        _testButton.backgroundColor = [UIColor redColor];
    }
    return _testButton;
}

@end
