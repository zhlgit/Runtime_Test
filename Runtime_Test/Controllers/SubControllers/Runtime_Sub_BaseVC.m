//
//  Runtime_Sub_BaseVC.m
//  RAC_Test
//
//  Created by jielisong on 2019/8/26.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "Runtime_Sub_BaseVC.h"

@interface Runtime_Sub_BaseVC ()

@property (nonatomic, strong) UILabel *lblTest;

@property (nonatomic, strong) NSArray *buttonTitleArray;

@end

@implementation Runtime_Sub_BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kColor(whiteColor);
    
    [self initData];
    [self initView];
}

-(void)initData{
    _buttonTitleArray = [self buttonTitleArray];
}

-(void)initView{
    __weak typeof(self) weakSelf = self;
    [_buttonTitleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btnTest = [UIButton buttonWithType:UIButtonTypeCustom];
        [weakSelf.view addSubview:btnTest];
        btnTest.frame = [self rectForButtonAtIndex:idx totalNum:weakSelf.buttonTitleArray.count];
        [btnTest setTitle:weakSelf.buttonTitleArray[idx] forState:UIControlStateNormal];
        btnTest.backgroundColor =kColor(redColor);
        btnTest.tag = idx;
        [btnTest addTarget:weakSelf action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }];
    
    _lblTest = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.center.y + 50, ScreenWidth, 30)];
    [self.view addSubview:_lblTest];
    _lblTest.textAlignment = NSTextAlignmentCenter;
    _lblTest.text = @"默认文本";
}

-(CGRect)rectForButtonAtIndex:(NSUInteger)index totalNum:(NSUInteger)totalNum{
    
    NSUInteger maxColumnNum = 4;
    CGFloat columnMargin = 20;
    CGFloat rowMargin = 20;
    CGFloat tempTotalNum = totalNum >= 4 ? 4 : totalNum;
    CGFloat width = (ScreenWidth - columnMargin * (tempTotalNum + 1)) / tempTotalNum;
    
    CGFloat height = 30;
    CGFloat offsetX = columnMargin + (width + columnMargin) * (index % maxColumnNum);
    CGFloat offsetY = self.view.center.y - 50 + (height + rowMargin) * (index / maxColumnNum);
    
    return CGRectMake(offsetX, offsetY, width, height);
    
}

-(void)buttonClick:(UIButton *)sender{
    
}

-(NSArray *)buttonTitleArray{
    return @[@"点击"];
}

-(void)setStrTest:(NSString *)strTest{
    _lblTest.text = strTest;
}

@end
