//
//  PortraitOutlineView.swift
//  BezierPathDemo
//
//  Created by Aditya on 07/09/24.
//

import UIKit

/// A custom UIView subclass that draws a mirrored outline resembling a portrait.
/// The outline includes the shoulder, neck, and head regions, drawn as bezier paths.
///
/// - Note: The view is transparent and only the outlines are visible.
/// - Important: Ensure that the view's bounds are sufficiently large for the drawing to be visible and clear.
class PortraitOutlineView: UIView {
    
    // MARK: - Initializers
    
    /// Initializes and returns a newly allocated view object with the specified frame rectangle.
    ///
    /// - Parameter frame: The frame rectangle for the view, measured in points.
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    /// Returns an object initialized from data in a given unarchiver.
    ///
    /// - Parameter coder: An unarchiver object.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
    }
    
    // MARK: - Drawing
    
    /// Draws the receiver’s image within the passed-in rectangle.
    ///
    /// This method creates two bezier paths to represent the left and right outlines of a portrait. The paths are symmetrical and mirror each other.
    ///
    /// - Parameter rect: The portion of the view’s bounds that needs to be updated.
    override func draw(_ rect: CGRect) {
        // Create the bezier path for the left outline
        let leftOutlinePath = UIBezierPath()
        
        // Start at the left edge, near the shoulder
        leftOutlinePath.move(to: CGPoint(x: rect.minX, y: rect.maxY * 0.7))
        
        // Draw the left shoulder curve
        leftOutlinePath.addCurve(to: CGPoint(x: rect.midX - 80, y: rect.maxY * 0.4),
                                 controlPoint1: CGPoint(x: rect.minX, y: rect.maxY * 0.5),
                                 controlPoint2: CGPoint(x: rect.midX - 95, y: rect.maxY * 0.42))
        
        // Draw the left neck curve
        leftOutlinePath.addCurve(to: CGPoint(x: rect.midX - 80, y: rect.maxY * 0.3),
                                 controlPoint1: CGPoint(x: rect.midX - 40, y: rect.maxY * 0.35),
                                 controlPoint2: CGPoint(x: rect.midX - 80, y: rect.maxY * 0.3))
        
        // Draw the left side of the head (lower half)
        leftOutlinePath.addCurve(to: CGPoint(x: rect.midX - 100, y: rect.maxY * 0.2),
                                 controlPoint1: CGPoint(x: rect.midX - 90, y: rect.maxY * 0.28),
                                 controlPoint2: CGPoint(x: rect.midX - 110, y: rect.maxY * 0.25))
        
        // Draw the left side of the head (upper half)
        leftOutlinePath.addCurve(to: CGPoint(x: rect.midX, y: rect.minY + 80),
                                 controlPoint1: CGPoint(x: rect.midX - 100, y: rect.maxY * 0.2),
                                 controlPoint2: CGPoint(x: rect.midX - 90, y: rect.minY + 80))
        
        // Create the mirrored right side path
        let rightOutlinePath = UIBezierPath()
        
        // Start at the right edge, mirroring the left start point
        rightOutlinePath.move(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.7))
        
        // Draw the right shoulder curve (mirror of left)
        rightOutlinePath.addCurve(to: CGPoint(x: rect.midX + 80, y: rect.maxY * 0.4),
                                  controlPoint1: CGPoint(x: rect.maxX, y: rect.maxY * 0.5),
                                  controlPoint2: CGPoint(x: rect.midX + 95, y: rect.maxY * 0.42))
        
        // Draw the right neck curve (mirror of left)
        rightOutlinePath.addCurve(to: CGPoint(x: rect.midX + 80, y: rect.maxY * 0.3),
                                  controlPoint1: CGPoint(x: rect.midX + 40, y: rect.maxY * 0.35),
                                  controlPoint2: CGPoint(x: rect.midX + 80, y: rect.maxY * 0.3))
        
        // Draw the right side of the head (lower half, mirror of left)
        rightOutlinePath.addCurve(to: CGPoint(x: rect.midX + 100, y: rect.maxY * 0.2),
                                  controlPoint1: CGPoint(x: rect.midX + 90, y: rect.maxY * 0.28),
                                  controlPoint2: CGPoint(x: rect.midX + 110, y: rect.maxY * 0.25))
        
        // Draw the right side of the head (upper half, mirror of left)
        rightOutlinePath.addCurve(to: CGPoint(x: rect.midX, y: rect.minY + 80),
                                  controlPoint1: CGPoint(x: rect.midX + 100, y: rect.maxY * 0.2),
                                  controlPoint2: CGPoint(x: rect.midX + 90, y: rect.minY + 80))
        
        // Set the stroke color and width for both paths
        UIColor.red.setStroke()
        leftOutlinePath.lineWidth = 4
        rightOutlinePath.lineWidth = 4
        
        // Draw both paths
        leftOutlinePath.stroke()
        rightOutlinePath.stroke()
    }
}
