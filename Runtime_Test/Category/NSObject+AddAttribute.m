//
//  NSObject+AddAttribute.m
//  RAC_Test
//
//  Created by jielisong on 2019/9/2.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import "NSObject+AddAttribute.h"
#import <objc/message.h>

@implementation NSObject (AddAttribute)

- (void)setAge:(NSInteger)age{
    
    objc_setAssociatedObject(self, @"age", @(age), OBJC_ASSOCIATION_RETAIN);
}

-(NSInteger)age{
    
    return [objc_getAssociatedObject(self, @"age") integerValue];
}

@end
