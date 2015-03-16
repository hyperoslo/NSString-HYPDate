@import Foundation;

@interface NSString (HYPDate)

+ (NSString *)hyp_timeString;

+ (NSString *)hyp_dateString;

+ (NSString *)hyp_dateStringWithFormat:(NSString *)format;

- (NSString *)hyp_timeString;

- (NSString *)hyp_dateString;

- (NSString *)hyp_dateStringWithFormat:(NSString *)format;

- (NSString *)hyp_timeRangeStringToEndDateString:(NSString *)endDateString;

- (NSString *)hyp_dateRangeStringToEndDateString:(NSString *)endDateString;

- (NSString *)hyp_dateRangeStringToEndDateString:(NSString *)endDateString
                                      withFormat:(NSString *)format;

@end
