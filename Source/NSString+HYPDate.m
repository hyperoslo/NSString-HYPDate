#import "NSString+HYPDate.h"

#import "ISO8601DateFormatter.h"

#import "NSDate+HYPString.h"

static NSString * const HYPDateDefaultFormat = @"yyyy-MM-dd";
static NSString * const HYPTimeDefaultFormat = @"HH:mm";
static NSString * const HYPTimeRangeFormat = @"%@ - %@";

@implementation NSString (HYPDate)

+ (NSString *)hyp_timeString
{
    return [[NSDate date] hyp_dateStringWithFormat:HYPTimeDefaultFormat];
}

+ (NSString *)hyp_dateString
{
    return [[NSDate date] hyp_dateStringWithFormat:HYPDateDefaultFormat];
}

+ (NSString *)hyp_dateStringWithFormat:(NSString *)format
{
    return [[NSDate date] hyp_dateStringWithFormat:format];
}

- (NSString *)hyp_timeString
{
    return [self hyp_dateStringWithFormat:HYPTimeDefaultFormat];
}

- (NSString *)hyp_dateString
{
    return [self hyp_dateStringWithFormat:HYPDateDefaultFormat];
}

- (NSString *)hyp_dateStringWithFormat:(NSString *)format
{
    NSDate *test = [NSString fromISO8601StringToDate:self];
    NSString *testStr = [test hyp_dateStringWithFormat:format];
    return testStr;
}

+ (NSString *)hyp_timeRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString
{
    return [self hyp_dateRangeStringFromStartDateString:startDateString
                                          endDateString:endDateString
                                             withFormat:HYPTimeDefaultFormat];
}

+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString
{
    return [self hyp_dateRangeStringFromStartDateString:startDateString
                                          endDateString:endDateString
                                             withFormat:HYPDateDefaultFormat];
}

+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString withFormat:(NSString *)format
{
    NSDate *startDate = [self fromISO8601StringToDate:startDateString];
    NSDate *endDate = [self fromISO8601StringToDate:endDateString];

    return [startDate hyp_dateRangeStringToEndDate:endDate
                                        withFormat:format];
}

#pragma mark - Private helper

+ (NSDate *)fromISO8601StringToDate:(NSString *)dateString
{
    return [[ISO8601DateFormatter new] dateFromString:dateString];
}

@end
