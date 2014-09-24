//
//  IFLSingleTagRequestTest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLSingleTagRequest.h"

@interface IFLSingleTagRequestTest : XCTestCase
@property(strong,nonatomic) NSURL* baseUrl;
@end

@implementation IFLSingleTagRequestTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.baseUrl = [[NSURL alloc]initWithString:@"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testValidContruction
{
    NSNumber* tagId = @538;
    NSString* valid = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/tag/538";
    
    IFLSingleTagRequest* tagRequest = [[IFLSingleTagRequest alloc]init];
    tagRequest.iflId = tagId;
    NSURL* url = [tagRequest generateRequestUrlFromBase:self.baseUrl];
    
    // Testing
    NSString* urlString = [url absoluteString];
    XCTAssert([valid isEqualToString:urlString], @"\n\nExpected: %@ \n\n Received %@\n\n",valid,urlString);
}

@end
