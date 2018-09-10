#import <Mantle.h>

#import "MercadoPagoAPI.h"

#import "NetworkConstants.h"

#import <AFNetworking.h>

#import "../Models/MTLPaymentMethod.h"

@implementation MercadoPagoAPI

+ (MercadoPagoAPI *)sharedAPI
{
    static MercadoPagoAPI *_sharedController = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        Class klass = NSClassFromString(@"MercadoPagoAPI") ?: self;
        _sharedController = [[klass alloc] init];
    });
    
    return _sharedController;
}

- (RACSignal *)paymentMethods {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *rawURL = [NSString stringWithFormat:MLPaymentMethods, @"444a9ef5-8a6b-429f-abdf-587639155d88"];
        NSURL *URL                      = [NSURL URLWithString:rawURL];
        AFHTTPSessionManager *manager   = [AFHTTPSessionManager manager];
        NSURLSessionDataTask *session = [manager GET:URL.absoluteString
             parameters:nil
               progress:nil
                success:^(NSURLSessionTask *task, id responseObject) {
                    NSError *modelError = nil;
                    NSArray *model = [MTLJSONAdapter modelsOfClass:MTLPaymentMethod.class fromJSONArray:responseObject error:&modelError];
                    if (modelError == nil) {
                        [subscriber sendNext:model];
                        [subscriber sendCompleted];
                    } else {
                        [subscriber sendError:modelError];
                    }
                }
                failure:^(NSURLSessionTask *operation, NSError *error) {
                    [subscriber sendError:error];
                }
         ];
        return [RACDisposable disposableWithBlock:^{
            [session cancel];
        }];
    }];
}

@end
