@import Foundation;

@interface NSString (HYPDate)

+ (NSString *)hyp_currentDateAsEventDateString;
+ (NSString *)hyp_dateStringFromDate:(NSDate *)date;
+ (NSString *)hyp_dateStringFromDateString:(NSString *)dateString;
+ (NSString *)hyp_dateRangeStringFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString endDateString:(NSString *)endDateString;

@end
