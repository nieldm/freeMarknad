#import "InstallmentCVCell.h"

#import "../../Models/FromService/MTLInstallment.h"

@interface InstallmentCVCell ()

@property (weak, nonatomic) IBOutlet UILabel *topLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *topRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomCenterLabel;
@property (weak, nonatomic) IBOutlet UILabel *installmentsLabel;

@end

@implementation InstallmentCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.layer setCornerRadius:6.0];
    [self.contentView.layer setCornerRadius:6.0];
}

- (void)setData:(MTLInstallment *)data {
    self.installmentsLabel.text = (data.numberOfInstallments > 1) ? @"cuotas" : @"cuota";
    self.topLeftLabel.text = [[NSNumber numberWithLong:data.numberOfInstallments] stringValue];
    self.topRightLabel.text = [[NSNumber numberWithFloat:data.installmentAmount] currency];
    self.bottomCenterLabel.text = data.recommendedMessage;
}

@end
