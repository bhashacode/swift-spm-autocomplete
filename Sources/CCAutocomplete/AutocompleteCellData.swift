//
//  AutocompleteCellData.swift
//  Autocomplete
//
//  Created by Amir Rezvani on 3/12/16.
//  Copyright © 2016 cjcoaxapps. All rights reserved.
//

import UIKit

public protocol AutocompletableOption {
    var text: String { get }
    var subTitle : String { get }
    var object : Any { get }
}

public class AutocompleteCellData: AutocompletableOption {
    public var object: Any
    private let _text: String
    public var text: String { get { return _text } }
    public let image: UIImage?
    private let _subTitle : String
    public var subTitle: String { get { return _subTitle }}
    public let titleFont  : UIFont?
    public let subTitleFont  : UIFont?
    

    public init(text: String, image: UIImage?,subTitle : String,object : Any?,font : UIFont?,sutitleFont : UIFont?) {
        self._text = text
        self.image = image
        self._subTitle = subTitle
        self.object = object
        self.titleFont = font
        self.subTitleFont = sutitleFont
    }
    
}
