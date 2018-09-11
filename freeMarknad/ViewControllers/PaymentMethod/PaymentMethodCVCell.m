#import "PaymentMethodCVCell.h"

#import "../../Models/FromService/MTLPaymentMethod.h"

#import <UIImageView+AFNetworking.h>

@interface PaymentMethodCVCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardIcon;

@end

@implementation PaymentMethodCVCell

- (void)setData:(MTLPaymentMethod *)data {
    self.nameLabel.text = data.name;
    NSURL *url = [[NSURL alloc] initWithString:data.thumbnail];
    if (url != nil) {
        [self.cardIcon setImageWithURL:url];
    }
}

@end
