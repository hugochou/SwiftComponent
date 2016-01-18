//
//  EVButton.swift
//
//  Created by ChrisZhou on 16/1/15.
//

import UIKit

public extension UIButton {
    public enum IconLocation {
        case Left, Right, Top, Bottom
    }
    
    /**
     设置按钮图标的位置
     注意：需设置完标题和图标后再调用此方法
     - parameter location: 图标位置
     - parameter spacing:  图标与标题的间距
     */
    public func iconOnThe(location:IconLocation = .Left, spacing:CGFloat = 0) {
        if let title = currentTitle, image = currentImage {
            let titleSize = title.sizeWithAttributes([NSFontAttributeName:(titleLabel?.font)!])
            let imageSize = image.size
            switch location {
            case .Left:iconOnTheLeft(titleSize, imageSize: imageSize, spacing: spacing)
            case .Right:iconOnTheRight(titleSize, imageSize:imageSize, spacing:spacing)
            case .Top:iconOnTheTop(titleSize, imageSize:imageSize, spacing:spacing)
            case .Bottom:iconOnTheBottom(titleSize, imageSize: imageSize, spacing: spacing)
            }
        }
    }
    
    private func iconOnTheLeft(titleSize:CGSize, imageSize:CGSize, spacing:CGFloat) {
        switch contentHorizontalAlignment {
        case .Left:
            titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0)
        case .Right:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing)
        case .Center:
            titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -spacing)
            imageEdgeInsets = UIEdgeInsetsMake(0, -spacing, 0, 0)
        default:break
        }
    }
    
    private func iconOnTheRight(titleSize:CGSize, imageSize:CGSize, spacing:CGFloat) {
        switch contentHorizontalAlignment {
        case .Left:
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, 0, 0)
            imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + spacing, 0, 0)
        case .Right:
            titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, imageSize.width + spacing)
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -titleSize.width)
        case .Center:
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.width * 2 + spacing), 0, 0)
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(titleSize.width * 2 + spacing))
        default: break
        }
    }
    
    private func iconOnTheTop(titleSize:CGSize, imageSize:CGSize, spacing:CGFloat) {
        let offsets = contentHorizontalOffsets(titleSize:titleSize, imageSize: imageSize)
        
        switch contentVerticalAlignment {
        case .Top:
            titleEdgeInsets = UIEdgeInsetsMake(imageSize.height + spacing, offsets.titleLeft, 0, offsets.titleRight)
            imageEdgeInsets = UIEdgeInsetsMake(0, offsets.imageLeft, 0, offsets.imageRight)
        case .Bottom:
            titleEdgeInsets = UIEdgeInsetsMake(0, offsets.titleLeft, imageSize.height + spacing, offsets.titleRight)
            imageEdgeInsets = UIEdgeInsetsMake(0, offsets.imageLeft, 0, offsets.imageRight)
        case .Center:
            titleEdgeInsets = UIEdgeInsetsMake(0, offsets.titleLeft, -(titleSize.height + spacing), offsets.titleRight)
            imageEdgeInsets = UIEdgeInsetsMake(-(imageSize.height + spacing), offsets.imageLeft, 0, offsets.imageRight)
        default:break
        }
    }
    
    private func iconOnTheBottom(titleSize:CGSize, imageSize:CGSize, spacing:CGFloat){
        let offsets = contentHorizontalOffsets(titleSize: titleSize, imageSize: imageSize)
        
        switch contentVerticalAlignment {
        case .Top:
            titleEdgeInsets = UIEdgeInsetsMake(0, offsets.titleLeft, 0, offsets.titleRight)
            imageEdgeInsets = UIEdgeInsetsMake((titleSize.height + spacing), offsets.imageLeft, 0, offsets.imageRight)
        case .Bottom:
            titleEdgeInsets = UIEdgeInsetsMake(0, offsets.titleLeft, imageSize.height + spacing, offsets.titleRight)
            imageEdgeInsets = UIEdgeInsetsMake(0, offsets.imageLeft, 0, offsets.imageRight)
        case .Center:
            titleEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), offsets.titleLeft, 0, offsets.titleRight)
            imageEdgeInsets = UIEdgeInsetsMake(0, offsets.imageLeft, -(imageSize.height + spacing), offsets.imageRight)
        default:break
        }
    }
    
    private func contentHorizontalOffsets(titleSize titleSize:CGSize, imageSize:CGSize) -> (titleLeft:CGFloat, titleRight:CGFloat, imageLeft:CGFloat, imageRight:CGFloat) {
        
        var titleLeft:CGFloat = 0, titleRight:CGFloat = 0
        var imageLeft:CGFloat = 0, imageRight:CGFloat = 0
        
        switch contentHorizontalAlignment {
        case .Left:
            titleLeft = -imageSize.width
        case .Right:
            imageRight = -titleSize.width
        case .Center:
            titleLeft = -imageSize.width
            imageRight = -titleSize.width
        default:break
            
        }
        
        return (titleLeft, titleRight, imageLeft, imageRight);
    }
}
