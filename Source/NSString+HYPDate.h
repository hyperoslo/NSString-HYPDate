@import Foundation;

static NSString * const HYPDefaultDateFormat = @"yyyy-MM-dd";
static NSString * const HYPDefaultTimeFormat = @"HH:mm";
static NSString * const HYPTimeRangeFormat = @"%@ - %@";

@interface NSString (HYPDate)

+ (NSString *)hyp_timeString;
+ (NSString *)hyp_dateString;
+ (NSString *)hyp_dateStringWithFormat:(NSString *)format;

+ (NSString *)hyp_timeStringFromDate:(NSDate *)date;
+ (NSString *)hyp_dateStringFromDate:(NSDate *)date;
+ (NSString *)hyp_dateStringFromDate:(NSDate *)date withFormat:(NSString *)format;

- (NSString *)hyp_timeString;
- (NSString *)hyp_dateString;
- (NSString *)hyp_dateStringWithFormat:(NSString *)format;

+ (NSString *)hyp_timeRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (NSString *)hyp_dateRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (NSString *)hyp_dateRangeStringFromStartDate:(NSDate *)startDate
                                       endDate:(NSDate *)endDate
                                    withFormat:(NSString *)format;;

+ (NSString *)hyp_timeRangeStringFromStartDateString:(NSString *)startDateString
                                       endDateString:(NSString *)endDateString;
+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString
                                       endDateString:(NSString *)endDateString;
+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString
                                       endDateString:(NSString *)endDateString
                                      withFormat:(NSString *)format;

@end
