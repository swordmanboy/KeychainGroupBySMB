//
//  DMPKeyChain.h
//  DMPKeyChainStore
//
//  Created by Nutchanon Viriyaprasart on 11/7/2559 BE.
//  Copyright © 2559 Nutchanon Viriyaprasart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UICKeyChainStore.h"

@interface DMPKeyChain : NSObject

+ (DMPKeyChain *)sharedInstance;
+ (void)initializeWithService:(NSString *)service forKey:(NSString *)key;
+ (void)generateDeviceIdOnComplete:(void (^)(BOOL success, NSString *valueString))block;

@property (nonatomic, strong) NSString *currentDeviceID;
@end
