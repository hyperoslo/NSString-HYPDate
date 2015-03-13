@import Foundation;

static NSString * const HYPDefaultDateFormat = @"yyyy-MM-dd";
static NSString * const HYPDefaultTimeFormat = @"HH:mm";
static NSString * const HYPTimeRangeFormat = @"%@ - %@";

@interface NSString (HYPDate)

+ (NSString *)hyp_currentDateAsTimeString;
+ (NSString *)hyp_currentDateAsDateString;
+ (NSString *)hyp_currentDateAsDateStringWithFormat:(NSString *)dateStringformat;

+ (NSString *)hyp_timeStringFromDate:(NSDate *)date;
+ (NSString *)hyp_dateStringFromDate:(NSDate *)date;
+ (NSString *)hyp_dateStringFromDate:(NSDate *)date withFormat:(NSString *)dateStringFormat;

- (NSString *)hyp_timeString;
- (NSString *)hyp_dateString;
- (NSString *)hyp_dateStringWithFormat:(NSString *)dateStringFormat;

+ (NSString *)hyp_timeRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (NSString *)hyp_dateRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (NSString *)hyp_dateRangeStringFromStartDate:(NSDate *)startDate
                                       endDate:(NSDate *)endDate
                                    withFormat:(NSString *)dateStringFormat;;

+ (NSString *)hyp_timeRangeStringFromStartDateString:(NSString *)startDateString
                                       endDateString:(NSString *)endDateString;
+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString
                                       endDateString:(NSString *)endDateString;
+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString
                                       endDateString:(NSString *)endDateString
                                      withFormat:(NSString *)dateStringFormat;

@end
