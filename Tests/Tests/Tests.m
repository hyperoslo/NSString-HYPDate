@import XCTest;

#import "NSString+HYPDate.h"

#import "ISO8601DateFormatter.h"

#define ARC4RANDOM_MAX 0x100000000

static const NSUInteger HYPTestLimit = 50;

@interface Tests : XCTestCase

@end

@implementation Tests

#pragma mark - Test API

- (void)testCurrentDateAsTimeString
{
    NSString *currentTimeString = [self dateStringFromDate:[NSDate date] withFormat:HYPDefaultTimeFormat];

    XCTAssertEqualObjects([NSString hyp_currentDateAsTimeString], currentTimeString);
}

- (void)testCurrentDateAsDateString
{
    NSString *currentDateString = [self dateStringFromDate:[NSDate date] withFormat:HYPDefaultDateFormat];

    XCTAssertEqualObjects([NSString hyp_currentDateAsDateString], currentDateString);
}

- (void)testCurrentDateAsDateStringWithFormat
{
    for (NSString *dateStringFormat in [Tests dateFormats]) {
        NSString *formattedCurrentDateString = [self dateStringFromDate:[NSDate date] withFormat:dateStringFormat];

        XCTAssertEqualObjects([NSString hyp_currentDateAsDateStringWithFormat:dateStringFormat], formattedCurrentDateString);
    }
}

- (void)testTimeStringFromDate
{
    for (NSDate *date in [self randomDates]) {
        NSString *timeString = [self dateStringFromDate:date withFormat:HYPDefaultTimeFormat];

        XCTAssertEqualObjects([NSString hyp_timeStringFromDate:date], timeString);
    }
}

- (void)testDateStringFromDate
{
    for (NSDate *date in [self randomDates]) {
        NSString *dateString = [self dateStringFromDate:date withFormat:HYPDefaultDateFormat];

        XCTAssertEqualObjects([NSString hyp_dateStringFromDate:date], dateString);
    }
}

- (void)testDateStringFromDateWithFormat
{
    for (NSDate *date in [self randomDates]) {
        for (NSString *dateStringFormat in [Tests dateFormats]) {
            NSString *formattedDateString = [self dateStringFromDate:date withFormat:dateStringFormat];

            XCTAssertEqualObjects([NSString hyp_dateStringFromDate:date withFormat:dateStringFormat], formattedDateString);
        }
    }
}

- (void)testTimeString
{
    for (NSString *dateString in [self randomDateStrings]) {
        NSString *timeString = [self testDateStringFromDateString:dateString withFormat:HYPDefaultTimeFormat];

        XCTAssertEqualObjects([dateString hyp_timeString], timeString);
    }
}

- (void)testDateString
{
    for (NSString *dateString in [self randomDateStrings]) {
        NSString *dateStr = [self testDateStringFromDateString:dateString withFormat:HYPDefaultDateFormat];

        XCTAssertEqualObjects([dateString hyp_dateString], dateStr);
    }
}

- (void)testDateStringWithFormat
{
    ISO8601DateFormatter *dateFormatter = [ISO8601DateFormatter new];

    for (NSString *dateString in [self randomDateStrings]) {
        for (NSString *dateStringFormat in [Tests dateFormats]) {
            NSString *formattedDateString = [self dateStringFromDate:[dateFormatter dateFromString:dateString] withFormat:dateStringFormat];

            XCTAssertEqualObjects([dateString hyp_dateStringWithFormat:dateStringFormat], formattedDateString);
        }
    }
}

- (void)testTimeRangeStringFromStartDateToEndDate
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        NSDate *startDate = [self randomDate];
        NSDate *endDate = [self randomDate];

        NSString *timeRange = [self dateRangeStringFromStartDate:startDate
                                                         endDate:endDate
                                                      withFormat:HYPDefaultTimeFormat];

        XCTAssertEqualObjects([NSString hyp_timeRangeStringFromStartDate:startDate endDate:endDate], timeRange);
    }
}

- (void)testDateRangeStringFromStartDateToEndDate
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        NSDate *startDate = [self randomDate];
        NSDate *endDate = [self randomDate];

        NSString *dateRange = [self dateRangeStringFromStartDate:startDate
                                                         endDate:endDate
                                                      withFormat:HYPDefaultDateFormat];

        XCTAssertEqualObjects([NSString hyp_dateRangeStringFromStartDate:startDate endDate:endDate], dateRange);
    }
}

- (void)testDateRangeStringFromStartDateToEndDateWithFormat
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        for (NSString *dateStringFormat in [Tests dateFormats]) {
            NSDate *startDate = [self randomDate];
            NSDate *endDate = [self randomDate];

            NSString *formattedDateRange = [self dateRangeStringFromStartDate:startDate
                                                                      endDate:endDate
                                                                   withFormat:dateStringFormat];

            XCTAssertEqualObjects([NSString hyp_dateRangeStringFromStartDate:startDate endDate:endDate withFormat:dateStringFormat], formattedDateRange);
        }
    }
}

- (void)testTimeRangeStringFromStartDateStringToEndDateString
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        NSString *startDateString = [self randomDateString];
        NSString *endDateString = [self randomDateString];

        NSString *timeRangeString = [self dateRangeStringFromStartDateString:startDateString
                                                               endDateString:endDateString
                                                                  withFormat:HYPDefaultTimeFormat];

        XCTAssertEqualObjects([NSString hyp_timeRangeStringFromStartDateString:startDateString endDateString:endDateString], timeRangeString);
    }
}

- (void)testDateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        NSString *startDateString = [self randomDateString];
        NSString *endDateString = [self randomDateString];

        NSString *dateRangeString = [self dateRangeStringFromStartDateString:startDateString
                                                               endDateString:endDateString
                                                                  withFormat:HYPDefaultDateFormat];

        XCTAssertEqualObjects([NSString hyp_dateRangeStringFromStartDateString:startDateString endDateString:endDateString], dateRangeString);
    }
}

- (void)testDateRangeStringFromStartDateStringToEndDateStringWithFormat
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        for (NSString *dateStringFormat in [Tests dateFormats]) {
            NSString *startDateString = [self randomDateString];
            NSString *endDateString = [self randomDateString];

            NSString *formattedDateRangeString = [self dateRangeStringFromStartDateString:startDateString
                                                                            endDateString:endDateString
                                                                               withFormat:dateStringFormat];

           XCTAssertEqualObjects([NSString hyp_dateRangeStringFromStartDateString:startDateString endDateString:endDateString withFormat:dateStringFormat], formattedDateRangeString);
        }
    }
}

#pragma mark - Test helpers

- (NSString *)testDateStringFromDateString:(NSString *)dateString withFormat:(NSString *)dateStringFormat
{
    NSDate *date = [[ISO8601DateFormatter new] dateFromString:dateString];

    return [self dateStringFromDate:date withFormat:dateStringFormat];
}

- (NSString *)dateStringFromDate:(NSDate *)date withFormat:(NSString *)dateStringFormat;
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = dateStringFormat;

    return [dateFormatter stringFromDate:date];
}

- (NSString *)dateRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate withFormat:(NSString *)dateStringFormat
{
    return [NSString stringWithFormat:HYPTimeRangeFormat,
            [NSString hyp_dateStringFromDate:startDate withFormat:dateStringFormat],
            [NSString hyp_dateStringFromDate:endDate withFormat:dateStringFormat]];
}

- (NSString *)dateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString withFormat:(NSString *)dateStringFormat
{
    ISO8601DateFormatter *dateFormatter = [ISO8601DateFormatter new];

    NSDate *startDate = [dateFormatter dateFromString:startDateString];
    NSDate *endDate = [dateFormatter dateFromString:endDateString];

    return [self dateRangeStringFromStartDate:startDate
                                      endDate:endDate
                                   withFormat:dateStringFormat];
}

#pragma mark - Test data generation

- (NSArray *)randomDates
{
    NSMutableArray *dates = [[NSMutableArray alloc] initWithCapacity:HYPTestLimit];

    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        dates[i] = [self randomDate];
    }

    return [dates copy];
}

- (NSArray *)randomDateStrings
{
    NSMutableArray *dateStrings = [[NSMutableArray alloc] initWithCapacity:HYPTestLimit];

    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        dateStrings[i] = [self randomDateString];
    }

    return [dateStrings copy];
}

- (NSDate *)randomDate
{
    NSTimeInterval maxTimeInterval = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval randomInterval = ((NSTimeInterval)arc4random() / ARC4RANDOM_MAX) * maxTimeInterval;

    return [NSDate dateWithTimeIntervalSinceReferenceDate:randomInterval];
}

- (NSString *)randomDateString
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [NSLocale currentLocale];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZZZZZ";

    return [dateFormatter stringFromDate:[self randomDate]];
}

#pragma mark - Static test data

+ (NSArray *)dateFormats
{
    return @[@"yyyy-MM-dd", @"yyyy-MM-dd HH:mm",
             @"dd-MM-yyyy", @"dd-MM-yyyy HH:mm",
             @"MMM dd, yyyy", @"MMM dd, yyyy HH:mm",
             @"invalidFormat"];
}

@end
