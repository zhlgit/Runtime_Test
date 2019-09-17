//
//  Runtime_Sub_EighthVC.m
//  RAC_Test
//
//  Created by jielisong on 2019/9/11.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "Runtime_Sub_EighthVC.h"
#import "Coding.h"

@interface Runtime_Sub_EighthVC ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation Runtime_Sub_EighthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initView{
    [super initView];
    NSDictionary *person = @{@"name":@"*******",@"sex":@"男"};
    NSDictionary *dict = @{@"coderID":@"100",@"nickName":@"以梦为马",@"phoneNumber":@"110",@"person":person};
    NSArray *addarr = @[dict,dict,dict];
    NSMutableDictionary *mudict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [mudict setObject:person forKey:@"person"];
    
    for (NSDictionary *item in addarr) {
        Coding *coding = [Coding modelWithDict:item];
        [self.dataArray addObject:coding];
    }
    if (self.dataArray.count) {
        self.strTest = @"字典转模型成功,点击查看对应的值";
    }
}

-(void)buttonClick:(UIButton *)sender{
    Coding *coding = self.dataArray.firstObject;
    switch (sender.tag) {
        case 0:{
            self.strTest = coding.coderID;
        }break;
        case 1:{
            self.strTest = coding.nickName;
        }break;
        case 2:{
            self.strTest = coding.phoneNumber;
        }break;
        case 3:{
            self.strTest = coding.person.name;
        }break;
        case 4:{
            self.strTest = coding.person.sex;
        }break;
        default:
            break;
    }
}

-(NSArray *)buttonTitleArray{
    return @[@"ID",@"昵称",@"手机号",@"姓名",@"性别"];
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
