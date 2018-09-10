#import <Foundation/Foundation.h>

enum PaymentServiceType {
    PaymentServiceMethods = 0,
    PaymentServiceBanks,
    PaymentServiceInstallments
};

@interface PaymentService : NSObject

+ (NSString *)paymentMethod:(NSString *)token;

@end
