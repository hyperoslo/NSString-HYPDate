#import "NSString+HYPDateString.h"

#import "NSDate+HYPISO8601.h"

static NSString * const HYPDateFormat = @"yyyy-MM-dd";
static NSString * const HYPDateRangeFormat = @"HH:mm";

@implementation NSString (HYPDate)

+ (NSString *)hyp_currentDateAsEventDateString
{
    return [self hyp_eventDateStringFromDate:[NSDate date]];
}

+ (NSString *)hyp_dateStringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:HYPEventDateFormat];

    return [dateFormat stringFromDate:date];
}

+ (NSString *)hyp_dateStringFromDateString:(NSString *)dateString
{
    NSDate *date = [NSDate hyp_dateFromISO8601String:dateString];

    return [self hyp_eventDateStringFromDate:date];
}

+ (NSString *)hyp_dateRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:HYPEventDateRangeFormat];

    return [NSString stringWithFormat:@"%@ - %@", [dateFormat stringFromDate:startDate],
            [dateFormat stringFromDate:endDate]];
}

+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString
{
    NSDate *startDate = [NSDate hyp_dateFromISO8601String:startDateString];
    NSDate *endDate = [NSDate hyp_dateFromISO8601String:endDateString];

    return [self hyp_eventDateRangeStringFromStartDate:startDate endDate:endDate];
}

@end
