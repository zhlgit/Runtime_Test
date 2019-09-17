//
//  Runtime_Sub_BaseVC.h
//  RAC_Test
//
//  Created by jielisong on 2019/8/26.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface Runtime_Sub_BaseVC : UIViewController

-(void)initView;

-(NSArray *)buttonTitleArray;

-(void)buttonClick:(UIButton *)sender;

@property (nonatomic, strong) NSString *strTest;

@end

NS_ASSUME_NONNULL_END
