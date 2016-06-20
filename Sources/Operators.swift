//
//  Operators.swift
//  Alexandria
//
//  Created by Jonathan Landon on 6/20/16.
//
//

postfix operator % {}

public postfix func %(value: CGFloat) -> CGFloat {
    return value / 100
}

public postfix func %(value: Float) -> Float {
    return value / 100
}

public postfix func %(value: Double) -> Double {
    return value / 100
}
