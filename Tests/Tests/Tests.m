@import XCTest;

#import "NSString+HYPDate.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testTimeStringClassMethod
{
    NSString *timeString = [NSString hyp_timeString];
    XCTAssertNotNil(timeString);
    XCTAssertEqual(timeString.length, 5);
}

- (void)testDateStringClassMethod
{
    NSString *dateString = [NSString hyp_dateString];
    XCTAssertNotNil(dateString);
    XCTAssertEqual(dateString.length, 10);
}

- (void)testDateStringWithFormatClassMethod
{
    NSString *dateString = [NSString hyp_dateStringWithFormat:@"dd.MM.yyyy"];
    XCTAssertNotNil(dateString);
    XCTAssertEqual(dateString.length, 10);
}

- (void)testTimeStringInstanceMethod
{

}

- (void)testDateStringInstanceMethod
{

}

- (void)testDateStringWithFormatInstanceMethod
{

}


- (void)testTimeRangeStringToEndDateString
{

}

- (void)testDateRangeStringToEndDateString
{

}

- (void)testDateRangeStringToEndDateStringWithFormat
{

}

@end
