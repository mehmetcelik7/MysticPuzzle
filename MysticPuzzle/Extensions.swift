//
//  Extensions.swift
//  MysticPuzzle
//
//  Created by mehmet Çelik on 23.03.2025.
//

import CoreGraphics

/// Return the distance from origin
public extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func distanceTo(point: CGPoint) -> CGFloat {
        let differenceOfPoints = self - point
        return differenceOfPoints.length()
    }
    
    static func - (left: CGPoint, right: CGPoint) -> CGPoint {

            let dx = left.x - right.x
            let dy = left.y - right.y
            
            return CGPoint(x: dx, y: dy)
        
    }
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
 
            let dx = left.x + right.x
            let dy = left.y + right.y
            
            return CGPoint(x: dx, y: dy)
        
    }
    static func * (point: CGPoint, scaler: CGFloat) -> CGPoint {
 
        let scaledX = point.x * scaler
        let scaledY = point.y * scaler
        
        return CGPoint(x: scaledX, y: scaledY)
        
    }

    
}
