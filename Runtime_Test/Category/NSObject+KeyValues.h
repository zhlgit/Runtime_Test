//
//  NSObject+KeyValues.h
//  RAC_Test
//
//  Created by jielisong on 2019/9/11.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ModelDelegate <NSObject>

@optional
//用在三级数组转换
+(NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (KeyValues)

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
