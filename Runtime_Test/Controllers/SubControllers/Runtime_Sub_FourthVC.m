//
//  Runtime_Sub_FourthVC.m
//  RAC_Test
//
//  Created by jielisong on 2019/9/10.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "Runtime_Sub_FourthVC.h"
#import "PersonModel.h"

@interface Runtime_Sub_FourthVC ()

@property (nonatomic, strong) PersonModel *person;

@end

@implementation Runtime_Sub_FourthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    [super initView];
    
    _person = [PersonModel new];
    NSLog(@"%@",_person.coding);
    NSLog(@"%@",_person.eating);
    Method oriMethod = class_getInstanceMethod(_person.class, @selector(coding));
    Method curMethod = class_getInstanceMethod(_person.class, @selector(eating));
    method_exchangeImplementations(oriMethod, curMethod);
}

-(NSArray *)buttonTitleArray{
    
    return @[@"coding",@"eating"];
}

-(void)buttonClick:(UIButton *)sender{
    if (sender.tag == 0) {
        self.strTest = [_person coding];
    }else{
        self.strTest = [_person eating];
    }
}



@end
