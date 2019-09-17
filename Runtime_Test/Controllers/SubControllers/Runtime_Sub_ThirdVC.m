//
//  Runtime_Sub_ThirdVC.m
//  RAC_Test
//
//  Created by jielisong on 2019/9/3.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "Runtime_Sub_ThirdVC.h"
#import "PersonModel.h"

@interface Runtime_Sub_ThirdVC ()

@property (nonatomic, strong) PersonModel *person;

@end

@implementation Runtime_Sub_ThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initView{
    [super initView];
    _person = [PersonModel new];
}

-(void)buttonClick:(UIButton *)sender{
    
    class_addMethod(_person.class, @selector(coding), (IMP)codingOC, "v@:");
//    调用coding方法响应事件
    if ([_person respondsToSelector:@selector(coding)]) {
        [_person performSelector:@selector(coding)];
        self.strTest = @"添加方法成功";
    } else {
        self.strTest = @"添加方法失败";
    }
}

void codingOC(id self,SEL _cmd){
    NSLog(@"添加方法成功");
}

@end
