
NSString *const MLPaymentMethods = @"https://api.mercadopago.com/v1/payment_methods?public_key=%@";
NSString *const MLCardIssuer = @"https://api.mercadopago.com/v1/payment_methods/card_issuers?public_key=%@&payment_method_id=%@​";
NSString *const MLInstallments = @"https://api.mercadopago.com/v1/payment_methods/installments?public_key=%@&amount=%@&payment_method_id=%@ &issuer.id=%@​";
