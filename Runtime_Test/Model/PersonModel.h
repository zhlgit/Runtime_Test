//
//  PersonModel.h
//  RAC_Test
//
//  Created by jielisong on 2019/8/26.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonModel : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *sex;

- (NSString *)coding;
- (NSString *)eating;
- (NSString *)changeMethod;

@end

NS_ASSUME_NONNULL_END
