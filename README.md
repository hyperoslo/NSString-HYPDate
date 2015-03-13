# NSString-HYPDate

[![CI Status](http://img.shields.io/travis/hyperoslo/NSString-HYPDate.svg?style=flat)](https://travis-ci.org/hyperoslo/NSString-HYPDate)
[![Version](https://img.shields.io/cocoapods/v/NSString-HYPDate.svg?style=flat)](http://cocoadocs.org/docsets/NSString-HYPDate)
[![License](https://img.shields.io/cocoapods/l/NSString-HYPDate.svg?style=flat)](http://cocoadocs.org/docsets/NSString-HYPDate)
[![Platform](https://img.shields.io/cocoapods/p/NSString-HYPDate.svg?style=flat)](http://cocoadocs.org/docsets/NSString-HYPDate)

## Usage

```objc
#import "NSString+HYPDate.h"

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
```

## Installation

**NSString-HYPDate** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod 'NSString-HYPDate'`

## Author

Hyper Interaktiv AS, teknologi@hyper.no

## License

**NSString-HYPDate** is available under the MIT license. See the LICENSE file for more info.
