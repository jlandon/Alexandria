//
//  NSDate+Extensions.swift
//
//  Created by Jonathan Landon on 4/15/15.
//
// The MIT License (MIT)
//
// Copyright (c) 2014-2016 Oven Bits, LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

extension NSDate {
    
    /**
     TimeFormat is an enum for formatting timestamps.
     
     Given an hour, minute, and second, the time will be formatted in one of four formats.
     - `HourMinuteMilitary` (e.g. "19:41")
     - `HourMinutePeriod` (e.g. "07:41 PM")
     - `HourMinuteSecondMilitary` (e.g. "19:41:30")
     - `HourMinuteSecondPeriod` (e.g. "07:41:30 PM")
     */
    public enum TimeFormat {
        /// Military time with hours and minutes (e.g. "19:41")
        case HourMinuteMilitary
        /// Standard time with hours and minutes (e.g. "07:41 PM")
        case HourMinutePeriod
        /// Military time with hours, minutes, and seconds (e.g. "19:41:30")
        case HourMinuteSecondMilitary
        /// Standard time with hours, minutes, and seconds (e.g. "07:41:30 PM")
        case HourMinuteSecondPeriod
        
        /// Time period (i.e. `AM` and `PM`)
        private enum Period: String {
            case AM
            case PM
        }
        
        /**
         Convert the hour, minute, and second to the specified format.
         
         - parameter hour: The hour.
         - parameter minute: The minute.
         - parameter second: The second.
         
         - returns: The formatted string
         */
        public func convert(hour hour: Int, minute: Int, second: Int) -> String {
            
            assert((0..<24).contains(hour), "The hour \(hour) is outside the valid range of 0-23")
            assert((0..<60).contains(minute), "The minute \(minute) is outside the valid range of 0-59")
            assert((0..<60).contains(second), "The second \(second) is outside the valid range of 0-59")
            
            switch self {
            case .HourMinuteMilitary:
                return String(format: "%02d:%02d", hour, minute)
            case .HourMinutePeriod:
                let (adjustedHour, period) = adjustHourForPeriod(hour)
                return String(format: "%02d:%02d %@", adjustedHour, minute, period.rawValue)
            case .HourMinuteSecondMilitary:
                return String(format: "%02d:%02d:%02d", hour, minute, second)
            case .HourMinuteSecondPeriod:
                let (adjustedHour, period) = adjustHourForPeriod(hour)
                return String(format: "%02d:%02d:%02d %@", adjustedHour, minute, second, period.rawValue)
            }
        }
        
        /**
         Adjust the hour to a 12-hour time and return the period.
         
         For example, and input of 13 returns (hour: 1, period: .PM).
         
         - parameter hour: The hour to adjust.
         
         - returns: The adjusted hour and period
         */
        private func adjustHourForPeriod(hour: Int) -> (hour: Int, period: Period) {
            let adjustedHour: Int
            let period: Period
            
            switch hour {
            case 0:
                adjustedHour = 12
                period = .AM
            case 12:
                adjustedHour = 12
                period = .PM
            case 13...23:
                adjustedHour = hour - 12
                period = .PM
            default:
                adjustedHour = hour
                period = .AM
            }
            
            return (hour: adjustedHour, period: period)
        }
    }
    
    /**
     Returns an NSDate object initialized with the provided month, day, and year
    
     - parameter month: The month
     - parameter day: The day
     - parameter year: The year
    
     - returns: An NSDate object initialized with the provided month, day, and year
     */
    public convenience init?(month: Int, day: Int, year: Int) {
        let calendar = NSCalendar.currentCalendar()
        
        let components = NSDateComponents()
        components.month = month
        components.day = day
        components.year = year
        
        if let date = calendar.dateFromComponents(components) {
            self.init(timeInterval: 0, sinceDate: date)
        }
        else {
            self.init(timeIntervalSince1970: 0) // required by the compiler
            return nil
        }
    }
    
    /// The current year
    public static var currentYear: Int {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let components = calendar.components(.Year, fromDate: NSDate())
        
        return components.year
    }
    
    /// The current month
    public static var currentMonth: Int {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let components = calendar.components(.Month, fromDate: NSDate())
        
        return components.month
    }
    
    /// The current day
    public static var currentDay: Int {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let components = calendar.components(.Day, fromDate: NSDate())
        
        return components.day
    }
    
    /// The current hour
    public static var currentHour: Int {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let components = calendar.components(.Hour, fromDate: NSDate())
        
        return components.hour
    }
    
    /// The current minute
    public static var currentMinute: Int {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let components = calendar.components(.Minute, fromDate: NSDate())
        
        return components.minute
    }
    
    /// The current second
    public static var currentSecond: Int {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let components = calendar.components(.Second, fromDate: NSDate())
        
        return components.second
    }
    
    /// The era component of self
    public final var era: Int {
        return components.era
    }
    
    /// The year component of self
    public final var year: Int {
        return components.year
    }
    
    /// The month component of self
    public final var month: Int {
        return components.month
    }
    
    /// The day component of self
    public final var day: Int {
        return components.day
    }
    
    /// The hour component of self
    public final var hour: Int {
        return components.hour
    }
    
    /// The minute component of self
    public final var minute: Int {
        return components.minute
    }
    
    /// The second component of self
    public final var second: Int {
        return components.second
    }
    
    /// The weekday component of self
    public final var weekday: Int {
        return components.weekday
    }
    
    /// The weekdayOrdinal component of self
    public final var weekdayOrdinal: Int {
        return components.weekdayOrdinal
    }
    
    /// The quarter component of self
    public final var quarter: Int {
        return components.quarter
    }
    
    /// The weekOfMonth component of self
    public final var weekOfMonth: Int {
        return components.weekOfMonth
    }
    
    /// The weekOfYear component of self
    public final var weekOfYear: Int {
        return components.weekOfYear
    }
    
    /// The yearForWeekOfYear component of self
    public final var yearForWeekOfYear: Int {
        return components.yearForWeekOfYear
    }
    
    /// The nanosecond component of self
    public final var nanosecond: Int {
        return components.nanosecond
    }
    
    /// The calendar component of self
    public final var calendar: NSCalendar? {
        return components.calendar
    }
    
    /// The timeZone component of self
    public final var timeZone: NSTimeZone? {
        return components.timeZone
    }
    
    /**
     The time, formatted with a specified TimeFormat.
     
     Format options:
     - `HourMinuteMilitary` (e.g. "19:41")
     - `HourMinutePeriod` (e.g. "07:41 PM")
     - `HourMinuteSecondMilitary` (e.g. "19:41:30")
     - `HourMinuteSecondPeriod` (e.g. "07:41:30 PM")
     
     Default format is `HourMinuteMilitary`.
     
     - parameter format: The format to use for the time (optional).
     
     - returns: The formatted time string.
     */
    public final func time(format: TimeFormat = .HourMinuteMilitary) -> String {
        return format.convert(hour: hour, minute: minute, second: second)
    }
}

// MARK: Private

extension NSDate {
    
    private final var autoupdatingCurrentCalendar: NSCalendar {
        return NSCalendar.autoupdatingCurrentCalendar()
    }
    
    private final var allCalendarComponents: NSCalendarUnit {
        return [
            .Era,
            .Year,
            .Month,
            .Day,
            .Hour,
            .Minute,
            .Second,
            .Weekday,
            .WeekdayOrdinal,
            .Quarter,
            .WeekOfMonth,
            .WeekOfYear,
            .YearForWeekOfYear,
            .Nanosecond,
            .Calendar,
            .TimeZone
        ]
    }
    
    private final var components: NSDateComponents {
        return autoupdatingCurrentCalendar.components(allCalendarComponents, fromDate: self)
    }
}

// MARK: Comparable

extension NSDate: Comparable {}

/// Returns true if both dates are equal to each other.
public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs === rhs || lhs.compare(rhs) == .OrderedSame
}

/// Returns true if the first date is less than the second date.
public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

