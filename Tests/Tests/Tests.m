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

    XCTAssertEqualObjects([NSString hyp_timeString], currentTimeString);
}

- (void)testCurrentDateAsDateString
{
    NSString *currentDateString = [self dateStringFromDate:[NSDate date] withFormat:HYPDefaultDateFormat];

    XCTAssertEqualObjects([NSString hyp_dateString], currentDateString);
}

- (void)testCurrentDateAsDateStringWithFormat
{
    for (NSString *format in [Tests dateFormats]) {
        NSString *formattedCurrentDateString = [self dateStringFromDate:[NSDate date] withFormat:format];

        XCTAssertEqualObjects([NSString hyp_dateStringWithFormat:format], formattedCurrentDateString);
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
        for (NSString *format in [Tests dateFormats]) {
            NSString *formattedDateString = [self dateStringFromDate:date withFormat:format];

            XCTAssertEqualObjects([NSString hyp_dateStringFromDate:date withFormat:format], formattedDateString);
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
        for (NSString *format in [Tests dateFormats]) {
            NSString *formattedDateString = [self dateStringFromDate:[dateFormatter dateFromString:dateString] withFormat:format];

            XCTAssertEqualObjects([dateString hyp_dateStringWithFormat:format], formattedDateString);
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
        for (NSString *format in [Tests dateFormats]) {
            NSDate *startDate = [self randomDate];
            NSDate *endDate = [self randomDate];

            NSString *formattedDateRange = [self dateRangeStringFromStartDate:startDate
                                                                      endDate:endDate
                                                                   withFormat:format];

            XCTAssertEqualObjects([NSString hyp_dateRangeStringFromStartDate:startDate endDate:endDate withFormat:format], formattedDateRange);
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
        for (NSString *format in [Tests dateFormats]) {
            NSString *startDateString = [self randomDateString];
            NSString *endDateString = [self randomDateString];

            NSString *formattedDateRangeString = [self dateRangeStringFromStartDateString:startDateString
                                                                            endDateString:endDateString
                                                                               withFormat:format];

           XCTAssertEqualObjects([NSString hyp_dateRangeStringFromStartDateString:startDateString endDateString:endDateString withFormat:format], formattedDateRangeString);
        }
    }
}

#pragma mark - Test helpers

- (NSString *)testDateStringFromDateString:(NSString *)dateString withFormat:(NSString *)format
{
    NSDate *date = [[ISO8601DateFormatter new] dateFromString:dateString];

    return [self dateStringFromDate:date withFormat:format];
}

- (NSString *)dateStringFromDate:(NSDate *)date withFormat:(NSString *)format;
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = format;

    return [dateFormatter stringFromDate:date];
}

- (NSString *)dateRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate withFormat:(NSString *)format
{
    return [NSString stringWithFormat:HYPTimeRangeFormat,
            [NSString hyp_dateStringFromDate:startDate withFormat:format],
            [NSString hyp_dateStringFromDate:endDate withFormat:format]];
}

- (NSString *)dateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString withFormat:(NSString *)format
{
    ISO8601DateFormatter *dateFormatter = [ISO8601DateFormatter new];

    NSDate *startDate = [dateFormatter dateFromString:startDateString];
    NSDate *endDate = [dateFormatter dateFromString:endDateString];

    return [self dateRangeStringFromStartDate:startDate
                                      endDate:endDate
                                   withFormat:format];
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
