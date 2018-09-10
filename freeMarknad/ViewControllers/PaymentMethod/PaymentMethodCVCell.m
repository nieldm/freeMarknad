//
//  PaymentMethodCVCell.m
//  freeMarknad
//
//  Created by Daniel Mendez on 9/10/18.
//  Copyright © 2018 nieldm. All rights reserved.
//

#import "PaymentMethodCVCell.h"

#import "../../Models/MTLPaymentMethod.h"

#import <UIImageView+AFNetworking.h>

@interface PaymentMethodCVCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardIcon;

@end

@implementation PaymentMethodCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(MTLPaymentMethod *)data {
    self.nameLabel.text = data.name;
    NSURL *url = [[NSURL alloc] initWithString:data.thumbnail];
    if (url != nil) {
        [self.cardIcon setImageWithURL:url];
    }
}

@end
