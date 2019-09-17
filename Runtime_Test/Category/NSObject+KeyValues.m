//
//  NSObject+KeyValues.m
//  RAC_Test
//
//  Created by jielisong on 2019/9/11.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "NSObject+KeyValues.h"
#import <objc/runtime.h>

@implementation NSObject (KeyValues)

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    
    id objc = [[self alloc] init];
    unsigned int count = 0;
//    获取成员属性数组
    Ivar *ivarList = class_copyIvarList(self, &count);
    //遍历所有的成员属性名
    for (int i = 0; i < count; i ++) {
        //获取成员属性
        Ivar ivar = ivarList[i];
        //获取成员属性名
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key = [ivarName substringFromIndex:1];
        //从字典中取出对应 value 给模型属性赋值
        id value = dict[key];
        //获取成员属性类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        //判断 value 是不是字典
        if ([value isKindOfClass:[NSDictionary class]]) {
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            Class modalClass = NSClassFromString(ivarType);
            //字典转模型
            if (modalClass) {
                value = [modalClass modelWithDict:value];
            }
        }
        if ([value isKindOfClass:[NSArray class]]) {
            //判断对应类有没有实现字典数组转模型数组的协议
            if ([self respondsToSelector:@selector(arrayContainModelClass)]) {
                //转成id 类型，就可以调用任何对象的方法
                id idSelf = self;
                //获取数组中字典对应的模型
                NSString *type = [idSelf arrayContainModelClass][key];
                //生成模型
                Class classModel = NSClassFromString(type);
                NSMutableArray *arrM = [NSMutableArray array];
                //遍历字典数组，生成模型数组
                for (NSDictionary *dict in value) {
                    //字典转模型
                    id model = [classModel modelWithDict:dict];
                    [arrM addObject:model];
                }
                //把模型数组赋值给value
                value = arrM;
            }
        }
        // KVC 字典转模型
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}

@end
