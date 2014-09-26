//
//  IFLWallpaperByTimestampRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLWallpaperByTimestampRequest.h"

@interface IFLWallpaperByTimestampRequestTest : XCTestCase
@property(strong,nonatomic) NSString* direction;
@property(strong,nonatomic) NSNumber* limit;
@property(strong,nonatomic) NSString* resolution;
@property(strong,nonatomic) NSNumber* tag_id;
@property(strong,nonatomic) NSNumber* timestamp;
@property(strong,nonatomic) NSString* base_url;
@end

@implementation IFLWallpaperByTimestampRequestTest

- (void)setUp {
    [super setUp];
    self.direction = @"newer";
    self.limit = @10;
    self.resolution = @"1920x1200";
    self.tag_id = @300;
    self.timestamp = @1346808341;
    self.base_url = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - URL Construction Test

-(void)testBasicInit
{
    IFLWallpaperByTimestampRequest* req = [[IFLWallpaperByTimestampRequest alloc]init];
    XCTAssert(req.timestamp == nil, @"Timestamp should be nil");
}

-(void)testRequiredParamInit
{
    IFLWallpaperByTimestampRequest* req = [[IFLWallpaperByTimestampRequest alloc]initWithTimestamp:self.timestamp];
    XCTAssert([req.timestamp isEqualToNumber:self.timestamp], @"Timestamp should match seed value");
}

#pragma mark - HappyPathUrlConstruction
-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapersByTimestamp/?timestamp=1346808341";
    IFLWallpaperByTimestampRequest* req = [[IFLWallpaperByTimestampRequest alloc]initWithTimestamp:self.timestamp];
    req.baseUrl = self.base_url;
    NSURL* url = [req generateRequestURL];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}

-(void)testCommandRequestURLWithOptionals_Direction
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapersByTimestamp/?direction=newer&timestamp=1346808341";
    IFLWallpaperByTimestampRequest* req = [[IFLWallpaperByTimestampRequest alloc]initWithTimestamp:self.timestamp];
    req.baseUrl = self.base_url;
    req.direction = self.direction;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]], @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]], @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}

-(void)testCommandRequestURLWithOptionals_DirectionLimit
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapersByTimestamp/?direction=newer&limit=10&timestamp=1346808341";
    IFLWallpaperByTimestampRequest* req = [[IFLWallpaperByTimestampRequest alloc]initWithTimestamp:self.timestamp];
    req.baseUrl = self.base_url;
    req.direction = self.direction;
    req.limit = self.limit;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]], @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]], @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
}

-(void)testCommandRequestURLwithOptionals_DirectionLimitResolution
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapersByTimestamp/?direction=newer&limit=10&resolution=1920x1200&timestamp=1346808341";
    IFLWallpaperByTimestampRequest* req = [[IFLWallpaperByTimestampRequest alloc]initWithTimestamp:self.timestamp];
    req.baseUrl = self.base_url;
    req.direction = self.direction;
    req.limit = self.limit;
    req.resolution = self.resolution;
    NSURL* url = [req generateRequestURL];

    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]], @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]], @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
}

-(void)testCommandRequestURLWithOptionals_DirectionLimitResolutionTagId
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapersByTimestamp/?direction=newer&limit=10&resolution=1920x1200&tag_id=300&timestamp=1346808341";
    IFLWallpaperByTimestampRequest* req = [[IFLWallpaperByTimestampRequest alloc]initWithTimestamp:self.timestamp];
    req.baseUrl = self.base_url;
    req.direction = self.direction;
    req.limit = self.limit;
    req.resolution = self.resolution;
    req.tag_id = self.tag_id;
    NSURL* url = [req generateRequestURL];

    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]], @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]], @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
}

@end
