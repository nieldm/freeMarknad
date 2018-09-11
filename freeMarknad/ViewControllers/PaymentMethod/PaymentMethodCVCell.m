#import "PaymentMethodCVCell.h"

#import "../../Models/FromService/MTLPaymentMethod.h"

#import <UIImageView+AFNetworking.h>

@interface PaymentMethodCVCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardIcon;
@property (weak, nonatomic) IBOutlet UIImageView *bankIcon;

@end

@implementation PaymentMethodCVCell

- (void)setData:(MTLPaymentMethod *)data {
    self.nameLabel.text = data.name;
    NSURL *url = [[NSURL alloc] initWithString:data.thumbnail];
    if (url != nil) {
        [self.cardIcon setImageWithURL:url];
    }
}

- (void)setBank:(NSString *)iconUrl {
    NSURL *url = [[NSURL alloc] initWithString:iconUrl];
    if (url != nil) {
        [self.bankIcon setHidden:NO];
        [self.bankIcon setImageWithURL:url];
    }
}

@end
