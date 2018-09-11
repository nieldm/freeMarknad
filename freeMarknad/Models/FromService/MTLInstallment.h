#import "MTLModel.h"

#import <Mantle.h>

@interface MTLInstallment : MTLModel <MTLJSONSerializing>

@property (nonatomic) float installmentAmount;
@property (nonatomic) long numberOfInstallments;
@property (nonatomic, copy) NSString *recommendedMessage;

@end
