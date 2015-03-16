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
    NSDate *isoString = [NSString dateFromISO8601String:self];

    return [isoString hyp_dateStringWithFormat:format];
}

- (NSString *)hyp_timeRangeStringToEndDateString:(NSString *)endDateString
{
    return [self hyp_dateRangeStringToEndDateString:endDateString
                                         withFormat:HYPTimeDefaultFormat];
}

- (NSString *)hyp_dateRangeStringToEndDateString:(NSString *)endDateString
{
    return [self hyp_dateRangeStringToEndDateString:endDateString
                                         withFormat:HYPDateDefaultFormat];
}

- (NSString *)hyp_dateRangeStringToEndDateString:(NSString *)endDateString
                                      withFormat:(NSString *)format
{
    NSDate *startDate = [NSString dateFromISO8601String:self];
    NSDate *endDate = [NSString dateFromISO8601String:endDateString];

    return [startDate hyp_dateRangeStringToEndDate:endDate
                                        withFormat:format];
}

#pragma mark - Private helper

+ (NSDate *)dateFromISO8601String:(NSString *)isoString
{
    return [[ISO8601DateFormatter new] dateFromString:isoString];
}

@end
