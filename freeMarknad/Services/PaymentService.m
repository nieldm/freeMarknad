#import "PaymentService.h"

@implementation PaymentService

+ (NSString *)paymentMethod:(NSString *)token {
    return [NSString stringWithFormat: @"https://api.mercadopago.com/v1/payment_methods?public_key=%@", token];
}

@end
