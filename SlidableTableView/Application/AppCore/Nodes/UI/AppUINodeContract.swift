//
//  AppUINodeContract.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//

import UIKit

enum AppUINodeActionType {
    //Session
    case prepareSession
}

protocol AppUINodeType: AnyObject {
    //MARK: - Device
    var deviceInterfaceType: AppUINDeviceInterfaceType? { get }
    var deviceOrientation: AppUINDeviceOrientation? { get }
    
    var screenSize: CGRect { get }
    var topPaddingValue: CGFloat { get }
    var bottomPaddingValue: CGFloat { get }
    
    var headerHeightValue: CGFloat { get }
    
    var uiItemCornerRadiusMedium: CGFloat { get }
    //MARK: - Style
    //Theme
    var currentTheme: UIUserInterfaceStyle { get }

    //Colors
    var colorClear: UIColor { get }
    var colorLightRed: UIColor { get }
    var colorRed: UIColor { get }
    var colorGreen: UIColor { get }
    var colorLightBlue: UIColor { get }
    var colorBlue: UIColor { get }
    var colorLightPurple: UIColor { get }
    var colorPurple: UIColor { get }
    //Fonts
    func font(for type: AppUINStyleLayerFontType, with style: UIFont.TextStyle) -> UIFont
    //Layers
    var layerBorderWidthWide: CGFloat { get }
    var layerBorderWidthRegular: CGFloat { get }
    var layerBorderWidthNarrow: CGFloat { get }
    var layerLineWidthWide: CGFloat { get }
    var layerLineWidthRegular: CGFloat { get }
    var layerLineWidthNarrow: CGFloat { get }
    var layerLineWidthExtraNarrow: CGFloat { get }
    //ImageNames
    var logoImageName: String { get }
    
    func invoke(sessionUID: UUID?, type: AppUINodeActionType)
}
