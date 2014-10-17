//
//  IFLSingleTagRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLSingleTagRequest.h"

@interface IFLSingleTagRequestTest : XCTestCase
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSString* base_url;
@end

@implementation IFLSingleTagRequestTest

- (void)setUp {
    [super setUp];
    self.iflId = @538;
    self.base_url = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
}

- (void)tearDown {
    [super tearDown];
}

-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/tag/538/";
    IFLSingleTagRequest* req = [[IFLSingleTagRequest alloc]initWithId:self.iflId];
    NSURL* url = [req generateRequestUrlWithBaseString:self.base_url];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}
@end
