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
    [self dateStringFromDate:[NSDate date] withFormat:HYPDefaultTimeFormat];
}

- (void)testCurrentDateAsDateString
{
    [self dateStringFromDate:[NSDate date] withFormat:HYPDefaultDateFormat];
}

- (void)testCurrentDateAsDateStringWithFormat
{
    for (NSString *dateStringFormat in [Tests dateFormats]) {
        [self dateStringFromDate:[NSDate date] withFormat:dateStringFormat];
    }
}

- (void)testTimeStringFromDate
{
    for (NSDate *date in [self randomDates]) {
        [self dateStringFromDate:date withFormat:HYPDefaultTimeFormat];
    }
}

- (void)testDateStringFromDate
{
    for (NSDate *date in [self randomDates]) {
        [self dateStringFromDate:date withFormat:HYPDefaultDateFormat];
    }
}

- (void)testDateStringFromDateWithFormat
{
    for (NSDate *date in [self randomDates]) {
        for (NSString *dateStringFormat in [Tests dateFormats]) {
            [self dateStringFromDate:date withFormat:dateStringFormat];
        }
    }
}

- (void)testTimeStringFromDateString
{
    for (NSString *dateString in [self randomDateStrings]) {
        [self testDateStringFromDateString:dateString withFormat:HYPDefaultTimeFormat];
    }
}

- (void)testDateStringFromDateString
{
    for (NSString *dateString in [self randomDateStrings]) {
        [self testDateStringFromDateString:dateString withFormat:HYPDefaultTimeFormat];
    }
}

- (void)testDateStringFromDateString:(NSString *)dateString withFormat:(NSString *)dateStringFormat
{
    NSDate *date = [[ISO8601DateFormatter new] dateFromString:dateString];

    [self dateStringFromDate:date withFormat:dateStringFormat];
}

- (void)testDateStringFromDateStringWithFormat
{
    ISO8601DateFormatter *dateFormatter = [ISO8601DateFormatter new];

    for (NSString *dateString in [self randomDateStrings]) {
        for (NSString *dateStringFormat in [Tests dateFormats]) {
            [self dateStringFromDate:[dateFormatter dateFromString:dateString]
                          withFormat:dateStringFormat];
        }
    }
}

- (void)testTimeRangeStringFromStartDateToEndDate
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        [self dateRangeStringFromStartDate:[self randomDate]
                                   endDate:[self randomDate]
                                withFormat:HYPDefaultTimeFormat];
    }
}

- (void)testDateRangeStringFromStartDateToEndDate
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        [self dateRangeStringFromStartDate:[self randomDate]
                                   endDate:[self randomDate]
                                withFormat:HYPDefaultDateFormat];
    }
}

- (void)testDateRangeStringFromStartDateToEndDateWithFormat
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        for (NSString *dateStringFormat in [Tests dateFormats]) {
            [self dateRangeStringFromStartDate:[self randomDate]
                                       endDate:[self randomDate]
                                    withFormat:dateStringFormat];
        }
    }
}

- (void)testTimeRangeStringFromStartDateStringToEndDateString
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        [self dateRangeStringFromStartDateString:[self randomDateString]
                                   endDateString:[self randomDateString]
                                      withFormat:HYPDefaultTimeFormat];
    }
}

- (void)testDateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        [self dateRangeStringFromStartDateString:[self randomDateString]
                                   endDateString:[self randomDateString]
                                      withFormat:HYPDefaultDateFormat];
    }
}

- (void)dateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString withFormat:(NSString *)dateStringFormat
{
    ISO8601DateFormatter *dateFormatter = [ISO8601DateFormatter new];

    NSDate *startDate = [dateFormatter dateFromString:startDateString];
    NSDate *endDate = [dateFormatter dateFromString:endDateString];

    [self dateRangeStringFromStartDate:startDate
                               endDate:endDate
                            withFormat:dateStringFormat];
}

- (void)testDateRangeStringFromStartDateStringToEndDateStringWithFormat
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        for (NSString *dateStringFormat in [Tests dateFormats]) {
            [self dateRangeStringFromStartDateString:[self randomDateString]
                                       endDateString:[self randomDateString]
                                          withFormat:dateStringFormat];
        }
    }
}

#pragma mark - Test actual implementation

- (void)dateStringFromDate:(NSDate *)date withFormat:(NSString *)dateStringFormat;
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = dateStringFormat;

    XCTAssertEqualObjects([NSString hyp_dateStringFromDate:date withFormat:dateStringFormat], [dateFormatter stringFromDate:date]);
}

- (void)dateRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate withFormat:(NSString *)dateStringFormat
{
    NSString *resultingString = [NSString stringWithFormat:HYPTimeRangeFormat,
                                 [NSString hyp_dateStringFromDate:startDate withFormat:dateStringFormat],
                                 [NSString hyp_dateStringFromDate:endDate withFormat:dateStringFormat]];

    XCTAssertEqualObjects([NSString hyp_dateRangeStringFromStartDate:startDate endDate:endDate withFormat:dateStringFormat], resultingString);
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
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
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
