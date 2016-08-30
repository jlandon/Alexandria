//
//  Date+Extensions.swift
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

extension Date {
    
    /**
     TimeFormat is an enum for formatting timestamps.
     
     Given an hour, minute, and second, the time will be formatted in one of four formats.
     - `hourMinuteMilitary` (e.g. "19:41")
     - `hourMinutePeriod` (e.g. "07:41 PM")
     - `hourMinuteSecondMilitary` (e.g. "19:41:30")
     - `hourMinuteSecondPeriod` (e.g. "07:41:30 PM")
     */
    public enum TimeFormat {
        /// Military time with hours and minutes (e.g. "19:41")
        case hourMinuteMilitary
        /// Standard time with hours and minutes (e.g. "07:41 PM")
        case hourMinutePeriod
        /// Military time with hours, minutes, and seconds (e.g. "19:41:30")
        case hourMinuteSecondMilitary
        /// Standard time with hours, minutes, and seconds (e.g. "07:41:30 PM")
        case hourMinuteSecondPeriod
        
        /// Time period (i.e. `AM` and `PM`)
        private enum Period: String {
            case am
            case pm
        }
        
        /**
         Convert the hour, minute, and second to the specified format.
         
         - parameter hour: The hour.
         - parameter minute: The minute.
         - parameter second: The second.
         
         - returns: The formatted string
         */
        public func stringify(hour: Int, minute: Int, second: Int) -> String {
            
            assert((0..<24).contains(hour), "The hour \(hour) is outside the valid range of 0-23")
            assert((0..<60).contains(minute), "The minute \(minute) is outside the valid range of 0-59")
            assert((0..<60).contains(second), "The second \(second) is outside the valid range of 0-59")
            
            switch self {
            case .hourMinuteMilitary:
                return String(format: "%02d:%02d", hour, minute)
            case .hourMinutePeriod:
                let (adjustedHour, period) = adjustHourForPeriod(hour)
                return String(format: "%02d:%02d %@", adjustedHour, minute, period.rawValue.uppercased())
            case .hourMinuteSecondMilitary:
                return String(format: "%02d:%02d:%02d", hour, minute, second)
            case .hourMinuteSecondPeriod:
                let (adjustedHour, period) = adjustHourForPeriod(hour)
                return String(format: "%02d:%02d:%02d %@", adjustedHour, minute, second, period.rawValue.uppercased())
            }
        }
        
        /**
         Adjust the hour to a 12-hour time and return the period.
         
         For example, and input of 13 returns (hour: 1, period: .PM).
         
         - parameter hour: The hour to adjust.
         
         - returns: The adjusted hour and period
         */
        private func adjustHourForPeriod(_ hour: Int) -> (hour: Int, period: Period) {
            let adjustedHour: Int
            let period: Period
            
            switch hour {
            case 0:
                adjustedHour = 12
                period = .am
            case 12:
                adjustedHour = 12
                period = .pm
            case 13...23:
                adjustedHour = hour - 12
                period = .pm
            default:
                adjustedHour = hour
                period = .am
            }
            
            return (hour: adjustedHour, period: period)
        }
    }
    
    /**
     Returns a Date value initialized with the provided month, day, and year
    
     - parameter month: The month
     - parameter day: The day
     - parameter year: The year
    
     - returns: A Date value initialized with the provided month, day, and year
     */
    public init?(month: Int, day: Int, year: Int) {
        let calendar = Calendar.autoupdatingCurrent
        let components = DateComponents(year: year, month: month, day: day)
        
        if let date = calendar.date(from: components) {
            self.init(timeInterval: 0, since: date)
        }
        else {
            self.init(timeIntervalSince1970: 0) // required by the compiler
            return nil
        }
    }
    
    /// The current year
    @available(*, deprecated: 2.0, message: "use Date().year")
    public static var currentYear: Int {
        return Date().year
    }
    
    /// The current month
    @available(*, deprecated: 2.0, message: "use Date().month")
    public static var currentMonth: Int {
        return Date().month
    }
    
    /// The current day
    @available(*, deprecated: 2.0, message: "use Date().day")
    public static var currentDay: Int {
        return Date().day
    }
    
    /// The current hour
    @available(*, deprecated: 2.0, message: "use Date().hour")
    public static var currentHour: Int {
        return Date().hour
    }
    
    /// The current minute
    @available(*, deprecated: 2.0, message: "use Date().minute")
    public static var currentMinute: Int {
        return Date().minute
    }
    
    /// The current second
    @available(*, deprecated: 2.0, message: "use Date().second")
    public static var currentSecond: Int {
        return Date().second
    }
    
    /// The era component of self
    public var era: Int {
        return components.era ?? 0
    }
    
    /// The year component of self
    public var year: Int {
        return components.year ?? 0
    }
    
    /// The month component of self
    public var month: Int {
        return components.month ?? 0
    }
    
    /// The day component of self
    public var day: Int {
        return components.day ?? 0
    }
    
    /// The hour component of self
    public var hour: Int {
        return components.hour ?? 0
    }
    
    /// The minute component of self
    public var minute: Int {
        return components.minute ?? 0
    }
    
    /// The second component of self
    public var second: Int {
        return components.second ?? 0
    }
    
    /// The weekday component of self
    public var weekday: Int {
        return components.weekday ?? 0
    }
    
    /// The weekdayOrdinal component of self
    public var weekdayOrdinal: Int {
        return components.weekdayOrdinal ?? 0
    }
    
    /// The quarter component of self
    public var quarter: Int {
        return components.quarter ?? 0
    }
    
    /// The weekOfMonth component of self
    public var weekOfMonth: Int {
        return components.weekOfMonth ?? 0
    }
    
    /// The weekOfYear component of self
    public var weekOfYear: Int {
        return components.weekOfYear ?? 0
    }
    
    /// The yearForWeekOfYear component of self
    public var yearForWeekOfYear: Int {
        return components.yearForWeekOfYear ?? 0
    }
    
    /// The nanosecond component of self
    public var nanosecond: Int {
        return components.nanosecond ?? 0
    }
    
    /// The calendar component of self
    public var calendar: Calendar? {
        return components.calendar
    }
    
    /// The timeZone component of self
    public var timeZone: TimeZone? {
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
    public func time(format: TimeFormat = .hourMinuteMilitary) -> String {
        return format.stringify(hour: hour, minute: minute, second: second)
    }
}

// MARK: Private

extension Date {
    
    fileprivate var allCalendarComponents: Set<Calendar.Component> {
        return [
            .era,
            .year,
            .month,
            .day,
            .hour,
            .minute,
            .second,
            .weekday,
            .weekdayOrdinal,
            .quarter,
            .weekOfMonth,
            .weekOfYear,
            .yearForWeekOfYear,
            .nanosecond,
            .calendar,
            .timeZone
        ]
    }
    
    fileprivate var components: DateComponents {
        return Calendar.autoupdatingCurrent.dateComponents(allCalendarComponents, from: self)
    }
}
