#import "MTLModel.h"

#import <Mantle.h>

@interface MTLBank : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString *processingMode;
@property (nonatomic, copy) NSString *status;

@end
