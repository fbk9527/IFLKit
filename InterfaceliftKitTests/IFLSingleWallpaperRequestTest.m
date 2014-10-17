//
//  IFLSingleWallpaperRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/26/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>s
#import "IFLSingleWallpaperRequest.h"

@interface IFLSingleWallpaperRequestTest : XCTestCase
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSString* base_url;
@end

@implementation IFLSingleWallpaperRequestTest

- (void)setUp {
    [super setUp];
    self.iflId = @3029;
    self.base_url = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
}

- (void)tearDown {
    [super tearDown];
}

-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpaper/3029/";
    IFLSingleWallpaperRequest* req = [[IFLSingleWallpaperRequest alloc]initWithId:self.iflId];
    NSURL* url = [req generateRequestUrlWithBaseString:self.base_url];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}

@end
