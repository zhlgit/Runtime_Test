//
//  Runtime_Sub_SeventhVC.m
//  RAC_Test
//
//  Created by jielisong on 2019/9/11.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "Runtime_Sub_SeventhVC.h"
#import "Coding.h"

@interface Runtime_Sub_SeventhVC ()

@end

@implementation Runtime_Sub_SeventhVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initView{
    [super initView];
    Coding *coding = [Coding new];
    coding.coderID = @"100";
    coding.nickName = @"以梦为马";
    coding.phoneNumber = @"110";
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:@"123"];
    [NSKeyedArchiver archiveRootObject:coding toFile:path];
    self.strTest = @"归档成功，点击按钮取出模型中对应的值";
}

-(NSArray *)buttonTitleArray{
    return @[@"第一个按钮",@"第二个按钮",@"第三个按钮"];
}

-(void)buttonClick:(UIButton *)sender{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:@"123"];
    Coding *coding = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (sender.tag == 0) {
        self.strTest = coding.coderID;
    }else if (sender.tag == 1){
        self.strTest = coding.nickName;
    }else{
        self.strTest = coding.phoneNumber;
    }
}


@end
