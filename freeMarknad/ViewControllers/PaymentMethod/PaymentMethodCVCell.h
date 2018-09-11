//
//  PaymentMethodCVCell.h
//  freeMarknad
//
//  Created by Daniel Mendez on 9/10/18.
//  Copyright © 2018 nieldm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTLPaymentMethod;

@interface PaymentMethodCVCell : UICollectionViewCell

- (void)setData:(MTLPaymentMethod *)data;
- (void)setBank:(NSString *)iconUrl;

@end
