//
//  IFLClientTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLClient.h"

@interface IFLClientTest : XCTestCase
@property(strong,nonatomic) NSString* privateKey;
@end

@implementation IFLClientTest

- (void)setUp {
    [super setUp];
    self.privateKey = @"A_FAKE_KEY";

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testBasicInitHeader
{
    IFLClient* client = [[IFLClient alloc]init];
    
    // Shared key should be nil.
    XCTAssert(!client.HTTPAuthenticationHeader[@"X-Mashape-Key"], @"auth header/dictionary should be nil");
    
}

-(void)testBasicInitHeaderWithPrivateKey
{
    IFLClient* client = [[IFLClient alloc]initWithPrivateKey:self.privateKey];
    XCTAssert([self.privateKey isEqualToString:client.HTTPAuthenticationHeader[@"X-Mashape-Key"]]);
}
@end
