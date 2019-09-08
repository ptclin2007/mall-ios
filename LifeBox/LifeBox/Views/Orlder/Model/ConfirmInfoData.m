//
//  ConfirmInfoData.m
//  LifeBox
//
//  Created by admin on 2019/9/8.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ConfirmInfoData.h"

@implementation ConfirmInfoAmount


@end
@implementation ConfirmInfoaddress


@end

@implementation ConfirmInfoData


+ (NSDictionary *)modelCustomPropertyMapper {

    return @{@"addressList" : @"memberReceiveAddressList",
             @"productList" : @"cartPromotionItemList",
             @"amountdata" : @"calcAmount"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"amountdata" : ConfirmInfoAmount.class,
             @"addressList" : [ConfirmInfoaddress class]
             };
}

-(ConfirmInfoaddress *)defaddress{
    for (ConfirmInfoaddress *data in _addressList) {
        if (data.defaultStatus == 0) {
            return data;
        }
    }
    return _addressList.firstObject;
}
@end
