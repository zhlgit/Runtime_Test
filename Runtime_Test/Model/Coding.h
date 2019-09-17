//
//  Coding.h
//  RAC_Test
//
//  Created by jielisong on 2019/9/11.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+KeyValues.h"
#import "PersonModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Coding : NSObject<NSCoding>

@property (nonatomic, strong) PersonModel *person;

@property (nonatomic, copy) NSString *coderID;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *phoneNumber;

@end

NS_ASSUME_NONNULL_END
