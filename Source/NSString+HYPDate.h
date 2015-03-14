@import Foundation;

@interface NSString (HYPDate)

+ (NSString *)hyp_timeString;

+ (NSString *)hyp_dateString;

+ (NSString *)hyp_dateStringWithFormat:(NSString *)format;

- (NSString *)hyp_timeString;

- (NSString *)hyp_dateString;

- (NSString *)hyp_dateStringWithFormat:(NSString *)format;

+ (NSString *)hyp_timeRangeStringFromStartDateString:(NSString *)startDateString
                                       endDateString:(NSString *)endDateString;

+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString
                                       endDateString:(NSString *)endDateString;

+ (NSString *)hyp_dateRangeStringFromStartDateString:(NSString *)startDateString
                                       endDateString:(NSString *)endDateString
                                          withFormat:(NSString *)format;

@end
