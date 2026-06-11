//
//  AutoCompleteCell.swift
//  Autocomplete
//
//  Created by Amir Rezvani on 3/6/16.
//  Copyright © 2016 cjcoaxapps. All rights reserved.
//

import UIKit
public class AutoCompleteCell: UITableViewCell {
    //MARK: - outlets
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet var lblSubTitle: UILabel!
    @IBOutlet private weak var imgIcon: UIImageView!

    //MARK: - public properties
    public var textImage: AutocompleteCellData? {
        didSet {
//            self.lblTitle.numberOfLines = 0
            self.lblTitle.text = textImage!.text.capitalized
            self.imgIcon.image = textImage!.image
            self.lblSubTitle.text = textImage!.subTitle.capitalized
            self.lblTitle.font = textImage?.titleFont
            self.lblSubTitle.font = textImage?.subTitleFont
        }
    }
}
