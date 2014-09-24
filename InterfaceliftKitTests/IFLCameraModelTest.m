//
//  IFLCameraModelTest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#include "IFLCamera.h"

@interface IFLCameraModelTest : XCTestCase
@property(strong,nonatomic) NSString* jsonLocation;
@end

@implementation IFLCameraModelTest

- (void)setUp {
    [super setUp];
     self.jsonLocation = @"/Users/freddy/Desktop/Daily_Gem_Assets/camera_object.json";
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void)testConstructionComplete
{
    NSError* error = nil;
    NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:self.jsonLocation]
                                                               options:0
                                                                 error:&error];
    
    if(error)
    {
        XCTAssert(NO, "Error parsing JSON Object: %@",error.description);
        return;
    }
    
    IFLCamera* camera = [[IFLCamera alloc]init];
    [camera populateFromJSONObject:jsonObject];
    
    ///======================================================================
    /// This test has every value populated. Nothing should be null
    ///======================================================================
    /// id                  - Integer based identification number (NSNumber)
    /// brand               - Brand of camera           (NSString)
    /// model               - Model of camera           (NSString)
    /// mount               - Camera mount used in shot (NSString)
    /// format              - Image format              (NSString)
    /// date_introduced     - Date introduced           (NSString)
    /// url_amazon          - Amazon                    (NSString)
    
    NSNumber* objId = [camera iflId];
    NSNumber* dctId = jsonObject[@"id"];
    XCTAssert(objId != nil);
    XCTAssert(dctId != nil);
    XCTAssert(objId != nil && dctId != nil && [objId isEqualToNumber:dctId]);
    
    
    NSString* objBrand = [camera brand];
    NSString* dctBrand = jsonObject[@"brand"];
    XCTAssert(objBrand != nil);
    XCTAssert(dctBrand != nil);
    XCTAssert(objBrand != nil && dctBrand != nil && [objBrand isEqualToString:dctBrand]);
    
    NSString* objModel = [camera model];
    NSString* dctModel = jsonObject[@"model"];
    XCTAssert(objModel != nil);
    XCTAssert(dctModel != nil);
    XCTAssert(objModel != nil && dctModel != nil && [objModel isEqualToString:dctModel]);
    
    NSString* objMount = [camera mount];
    NSString* dctMount = jsonObject[@"mount"];
    XCTAssert(objMount != nil);
    XCTAssert(dctMount != nil);
    XCTAssert(objMount != nil && dctMount != nil && [objMount isEqualToString:dctMount]);
    
    
    NSString* objFormat = [camera format];
    NSString* dctFormat = jsonObject[@"format"];
    XCTAssert(objFormat != nil);
    XCTAssert(dctFormat != nil);
    XCTAssert(objFormat != nil && dctFormat != nil && [objFormat isEqualToString:dctFormat]);
    
    
    NSString* objDtIntroduced = [camera date_introduced];
    NSString* dctDtIntroduced = jsonObject[@"date_introduced"];
    XCTAssert(objDtIntroduced !=nil);
    XCTAssert(dctDtIntroduced !=nil);
    XCTAssert(objDtIntroduced!=nil && dctDtIntroduced!=nil && [objDtIntroduced isEqualToString:dctDtIntroduced]);
    
    NSString* objAmazonUrl = [camera url_amazon];
    NSString* dctAmazonUrl = jsonObject[@"url_amazon"];
    XCTAssert(objAmazonUrl!=nil);
    XCTAssert(dctAmazonUrl!=nil);
    XCTAssert(objAmazonUrl!=nil && dctAmazonUrl!=nil && [objAmazonUrl isEqualToString:dctAmazonUrl]);
}

@end
