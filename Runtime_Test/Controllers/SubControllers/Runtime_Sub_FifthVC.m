//
//  Runtime_Sub_FifthVC.m
//  RAC_Test
//
//  Created by jielisong on 2019/9/10.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "Runtime_Sub_FifthVC.h"
#import "PersonModel.h"
#import "Library.h"

@interface Runtime_Sub_FifthVC ()

@property (nonatomic, strong) PersonModel *person;

@property (nonatomic, strong) Library *library;

@end

@implementation Runtime_Sub_FifthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)initView{
    [super initView];
    _library = [Library new];
    _person = [PersonModel new];
    self.strTest = [_library libraryMethod];
    Method oriMethod = class_getInstanceMethod(_person.class, @selector(changeMethod));
    Method curMethod = class_getInstanceMethod(_library.class, @selector(libraryMethod));
    method_exchangeImplementations(oriMethod, curMethod);
}

-(void)buttonClick:(UIButton *)sender{
    self.strTest = [_library libraryMethod];
}

@end
