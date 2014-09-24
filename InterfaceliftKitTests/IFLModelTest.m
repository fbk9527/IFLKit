//
//  IFLModelTest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLModel.h"

@interface IFLModelTest : XCTestCase

@end

@implementation IFLModelTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

-(void)testNonNullReturn
{
    XCTAssert([IFLModel renamedKeys], @"Instance method %s should never return null!",__PRETTY_FUNCTION__);
}

-(void)testKnownRenamedObjects
{
    NSString* idRenameKey = @"id";
    NSString* idRenameVal = @"iflId";
    
    NSDictionary* renamedKy = [IFLModel renamedKeys];
    
    XCTAssert([renamedKy objectForKeyedSubscript:idRenameKey], @"Renamed Dictionary should have value for key: %@",idRenameKey);
    XCTAssert([[renamedKy objectForKeyedSubscript:idRenameKey]isEqualToString:idRenameVal], @"Renamed Dictonary should have value %@ for key %@",idRenameKey, idRenameVal);
}

@end
