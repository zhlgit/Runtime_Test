//
//  Runtime_Sub_SecondVC.m
//  RAC_Test
//
//  Created by jielisong on 2019/9/2.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "Runtime_Sub_SecondVC.h"
#import "NSObject+AddAttribute.h"
#import <objc/runtime.h>

@interface Runtime_Sub_SecondVC ()

@property (nonatomic, strong) NSObject  *person;

@end

@implementation Runtime_Sub_SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    _person = [NSObject new];
    _person.age = 11;
}

-(void)buttonClick:(UIButton *)sender{
  
    self.strTest = _person.age == 0 ? @"添加属性失败" : [NSString stringWithFormat:@"添加的属性为age，并赋值为%@",@(_person.age)];
}


@end
