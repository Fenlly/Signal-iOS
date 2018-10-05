//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

#import "SSKBaseTestObjC.h"
#import "OWSPrimaryStorage.h"
#import "SSKEnvironment.h"
#import "TestAppContext.h"

NS_ASSUME_NONNULL_BEGIN

#ifdef DEBUG

@implementation SSKBaseTestObjC

- (void)setUp
{
    NSLog(@"%@ setUp", self.logTag);

    [super setUp];

    ClearCurrentAppContextForTests();
    SetCurrentAppContext([TestAppContext new]);

    [MockSSKEnvironment activate];
}

- (void)tearDown
{
    NSLog(@"%@ tearDown", self.logTag);

    [super tearDown];
}

- (void)readWithBlock:(void (^)(YapDatabaseReadTransaction *transaction))block
{
    OWSAssert(block);

    [[SSKEnvironment.shared.primaryStorage newDatabaseConnection] readWithBlock:block];
}


- (void)readWriteWithBlock:(void (^)(YapDatabaseReadWriteTransaction *transaction))block
{
    OWSAssert(block);

    [[SSKEnvironment.shared.primaryStorage newDatabaseConnection] readWriteWithBlock:block];
}

@end

#endif

NS_ASSUME_NONNULL_END