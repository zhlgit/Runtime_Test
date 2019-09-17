//
//  CountButton.m
//  RAC_Test
//
//  Created by jielisong on 2019/8/26.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "CountButton.h"
#import <objc/runtime.h>

@implementation CountButton

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oriMethod = class_getInstanceMethod(self.class, @selector(sendAction:to:forEvent:));
        Method cusMethod = class_getInstanceMethod(self.class, @selector(customSendAction:to:forEvent:));
        //判断自定义的方法是否实现，n避免崩溃
        BOOL addSuccess = class_addMethod(self.class, @selector(sendAction:to:forEvent:), method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
        if (addSuccess) {
//            没有实现，将源方法的实现替换到交换方法的实现
            class_replaceMethod(self.class, @selector(customSendAction:to:forEvent:), method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        }else{
//            已经实现，直接交换方法
            method_exchangeImplementations(oriMethod, cusMethod);
        }
    });
}

-(void)customSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    _count = [[ClickCount shareInstance] clickCount];
    [self customSendAction:action to:target forEvent:event];
}

@end

@interface ClickCount ()

@property (nonatomic, assign) NSInteger count;

@end

@implementation ClickCount


+ (instancetype)shareInstance{
    static ClickCount *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (NSInteger)clickCount{
    _count ++;
    NSLog(@"点击了%@次",@(_count));
    return _count;
}


@end
