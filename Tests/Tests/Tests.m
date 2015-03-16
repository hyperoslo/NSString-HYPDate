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
    XCTAssertEqualObjects(@"08:35", [@"2015-03-12T08:35:56.804Z" hyp_timeString]);
}

- (void)testDateStringInstanceMethod
{
    XCTAssertEqualObjects(@"2000-01-01", [@"2000-01-01T10:10:00.002Z" hyp_dateString]);
}

- (void)testDateStringWithFormatInstanceMethod
{
    XCTAssertEqualObjects(@"01.01.2000", [@"2000-01-01T10:10:00.002Z" hyp_dateStringWithFormat:@"dd.MM.yyyy"]);
}

- (void)testTimeRangeStringToEndDateString
{
    NSString *startDateString = @"2000-01-01T10:10:00.002Z";
    NSString *endDateString = @"2000-01-02T11:10:00.002Z";

    XCTAssertEqualObjects(@"10:10 - 11:10", [startDateString hyp_timeRangeStringToEndDateString:endDateString]);
}

- (void)testDateRangeStringToEndDateString
{
    NSString *startDateString = @"2000-01-01T10:10:00.002Z";
    NSString *endDateString = @"2000-01-02T10:10:00.002Z";

    XCTAssertEqualObjects(@"2000-01-01 - 2000-01-02", [startDateString hyp_dateRangeStringToEndDateString:endDateString]);
}

- (void)testDateRangeStringToEndDateStringWithFormat
{
    NSString *startDateString = @"2000-01-01T10:10:00.002Z";
    NSString *endDateString = @"2000-01-02T10:10:00.002Z";

    XCTAssertEqualObjects(@"01.01.2000 - 02.01.2000", [startDateString hyp_dateRangeStringToEndDateString:endDateString withFormat:@"dd.MM.yyyy"]);
}

@end
