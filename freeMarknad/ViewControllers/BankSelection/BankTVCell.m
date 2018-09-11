#import "BankTVCell.h"

#import "../../Models/FromService/MTLBank.h"

#import <UIImageView+AFNetworking.h>

@interface BankTVCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation BankTVCell

- (void)setData:(MTLBank *)data {
    self.nameLabel.text = data.name;
    NSURL *url = [[NSURL alloc] initWithString:data.thumbnail];
    if (url != nil) {
        [self.iconImage setImageWithURL:url];
    }
}

@end
