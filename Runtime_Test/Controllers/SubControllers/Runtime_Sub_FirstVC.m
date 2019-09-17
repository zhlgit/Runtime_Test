//
//  Runtime_Sub_FirstVC.m
//  RAC_Test
//
//  Created by jielisong on 2019/8/26.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "Runtime_Sub_FirstVC.h"
#import "PersonModel.h"

@interface Runtime_Sub_FirstVC ()

@property (nonatomic, strong) PersonModel *person;

@end

@implementation Runtime_Sub_FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    _person = [PersonModel new];
}

-(void)buttonClick:(UIButton *)sender{
    
    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList(_person.class, &count);
    for (int i = 0; i < count; i ++) {
        Ivar tempIvar = ivar[i];
        const char *varChar = ivar_getName(tempIvar);
        NSString *strVar = [NSString stringWithUTF8String:varChar];
        if ([strVar isEqualToString:@"_name"]) {
            object_setIvar(_person, tempIvar, @"更改属性值成功");
            break;
        }
    }
    self.strTest = _person.name.length ? _person.name : @"更改属性值失败";
    
}


@end
