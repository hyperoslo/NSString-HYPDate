#import "NSString+HYPDate.h"

#import "ISO8601DateFormatter.h"

@implementation NSString (HYPDate)

+ (NSString *)hyp_currentDateAsTimeString
{
    return [self hyp_dateStringFromDate:[NSDate date] withFormat:HYPDefaultTimeFormat];
}

+ (NSString *)hyp_currentDateAsDateString
{
    return [self hyp_dateStringFromDate:[NSDate date] withFormat:HYPDefaultDateFormat];
}

+ (NSString *)hyp_currentDateAsDateStringWithFormat:(NSString *)dateStringFormat
{
    return [self hyp_dateStringFromDate:[NSDate date] withFormat:dateStringFormat];
}

+ (NSString *)hyp_timeStringFromDate:(NSDate *)date
{
    return [self hyp_dateStringFromDate:date withFormat:HYPDefaultTimeFormat];
}

+ (NSString *)hyp_dateStringFromDate:(NSDate *)date
{
    return [self hyp_dateStringFromDate:date withFormat:HYPDefaultDateFormat];
}

+ (NSString *)hyp_dateStringFromDate:(NSDate *)date withFormat:(NSString *)dateStringFormat
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:dateStringFormat];

    return [dateFormatter stringFromDate:date];
}

- (NSString *)hyp_timeString
{
    return [self hyp_dateStringWithFormat:HYPDefaultTimeFormat];
}

- (NSString *)hyp_dateString
{
    return [self hyp_dateStringWithFormat:HYPDefaultDateFormat];
}

- (NSString *)hyp_dateStringWithFormat:(NSString *)dateStringFormat
{
    NSDate *test = [NSString fromISO8601StringToDate:self];
    NSString *testStr = [NSString hyp_dateStringFromDate:test withFormat:dateStringFormat];
    return testStr;
}

+ (NSString *)hyp_timeRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    return [self hyp_dateRangeStringFromStartDate:startDate endDate:endDate withFormat:HYPDefaultTimeFormat];
}

+ (NSString *)hyp_dateRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    return [self hyp_dateRangeStringFromStartDate:startDate endDate:endDate withFormat:HYPDefaultDateFormat];
}

+ (NSString *)hyp_dateRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate withFormat:(NSString *)dateStringFormat
{
    return [NSString stringWithFormat:HYPTimeRangeFormat,
            [self hyp_dateStringFromDate:startDate withFormat:dateStringFormat],
            [self hyp_dateStringFromDate:endDate withFormat:dateStringFormat]];
}

+ (NSString *)hyp_timeRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString
{
    return [self hyp_dateRangeStringFromStartDateString:startDateString
                                          endDateString:endDateString
                                         withFormat:HYPDefaultTimeFormat];
}

+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString
{
    return [self hyp_dateRangeStringFromStartDateString:startDateString
                                          endDateString:endDateString
                                         withFormat:HYPDefaultDateFormat];
}

+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString withFormat:(NSString *)dateStringFormat
{
    return [self hyp_dateRangeStringFromStartDate:[self fromISO8601StringToDate:startDateString]
                                          endDate:[self fromISO8601StringToDate:endDateString]
                                   withFormat:dateStringFormat];
}

#pragma mark - Private helper

+ (NSDate *)fromISO8601StringToDate:(NSString *)dateString
{
    return [[ISO8601DateFormatter new] dateFromString:dateString];
}

@end
