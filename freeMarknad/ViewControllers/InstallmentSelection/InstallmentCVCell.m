#import "InstallmentCVCell.h"

#import "../../Models/FromService/MTLInstallment.h"

@interface InstallmentCVCell ()

@property (weak, nonatomic) IBOutlet UILabel *topLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *topRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomCenterLabel;
@property (weak, nonatomic) IBOutlet UILabel *installmentsLabel;

@end

@implementation InstallmentCVCell

- (void)setData:(MTLInstallment *)data {
    self.installmentsLabel.text = (data.numberOfInstallments > 1) ? @"cuotas" : @"cuota";
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    [formatter setGroupingSeparator:groupingSeparator];
    [formatter setGroupingSize:3];
    [formatter setAlwaysShowsDecimalSeparator:NO];
    [formatter setUsesGroupingSeparator:YES];
    [formatter setCurrencySymbol:nil];
    self.topLeftLabel.text = [[NSNumber numberWithLong:data.numberOfInstallments] stringValue];
    self.topRightLabel.text = [formatter stringFromNumber:[NSNumber numberWithFloat:data.installmentAmount]];
    self.bottomCenterLabel.text = data.recommendedMessage;
}

@end
