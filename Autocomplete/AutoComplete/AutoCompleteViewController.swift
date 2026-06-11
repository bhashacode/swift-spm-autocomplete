//
//  AutoCompleteViewController.swift
//  Autocomplete
//
//  Created by Amir Rezvani on 3/6/16.
//  Copyright © 2016 cjcoaxapps. All rights reserved.
//

import UIKit


let AutocompleteCellReuseIdentifier = "autocompleteCell"

public class AutoCompleteViewController: UIViewController {
    //MARK: - outlets
    @IBOutlet private weak var tableView: UITableView!

    //MARK: - internal items
    internal var autocompleteItems: [AutocompletableOption]?
    internal var cellHeight: CGFloat?
    internal var cellDataAssigner: ((_ cell: UITableViewCell, _ data: AutocompletableOption) -> Void)?
    internal var textField: UITextField?
    internal let animationDuration: TimeInterval = 0.2
    internal var ogFrame: CGRect!

    //MARK: - private properties
    private var autocompleteThreshold: Int?
    private var maxHeight: CGFloat = 0
    private var height: CGFloat = 0

    //MARK: - public properties
    public weak var delegate: AutocompleteDelegate?

    //MARK: - view life cycle
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.view.isHidden = true
        self.textField = self.delegate!.autoCompleteTextField()

        self.height = self.delegate!.autoCompleteHeight()
        
        let frame =  self.textField?.superview?.convert((self.textField?.frame)!, to: self.textField?.superview?.superview?.superview?.superview?.superview?.superview)
        
       
        print("TextFiled Frame ", textField?.layer.frame)
        
        self.view.frame = CGRect(
            x: (frame?.minX)! + 10,
            y: max((frame?.minY)! - self.height, 0),
            width: self.textField!.frame.size.width - 20,
            height: self.height
        )
        self.ogFrame = self.view.frame
        
        

        self.tableView.register(self.delegate!.nibForAutoCompleteCell(), forCellReuseIdentifier: AutocompleteCellReuseIdentifier)

        self.textField?.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.autocompleteThreshold = self.delegate!.autoCompleteThreshold(textField: self.textField!)
        self.cellDataAssigner = self.delegate!.getCellDataAssigner()

        self.cellHeight = self.delegate!.heightForCells()
        // not to go beyond bound height if list of items is too big
        self.maxHeight = self.delegate?.maxHeightForController() ?? (UIScreen.main.bounds.height - self.view.frame.minY)
        
        
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: (self.textField?.frame.size.width)!, height: 0.0001))
        
        // self.tableView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        
        
        self.tableView.backgroundColor = UIColor.clear
        
        
    }
    
    //MARK: - private methods
    @objc func textDidChange(textField: UITextField) {
        
        
        
        let numberOfCharacters = textField.text?.characters.count
        if let numberOfCharacters = numberOfCharacters {
            if numberOfCharacters > self.autocompleteThreshold! {
                
                if self.view.isHidden{
                    let frame =  self.textField?.superview?.convert((self.textField?.frame)!, to: self.textField?.superview?.superview?.superview?.superview?.superview?.superview)
                    print("Adjusted TextFiled Frame ", textField.layer.frame)
                    self.view.frame = CGRect(
                        x: (frame?.minX)! + 10,
                        y: max((frame?.minY)! - self.height, 0),
                        width: self.textField!.frame.size.width - 20,
                        height: self.height)
                    self.ogFrame = self.view.frame
                }
                
                self.view.isHidden = false
                guard let searchTerm = textField.text else { return }
                self.autocompleteItems = self.delegate!.autoCompleteItemsForSearchTerm(term: searchTerm)
                
                let contentHeight = CGFloat(self.autocompleteItems!.count) * CGFloat(self.cellHeight!)
                
                self.view.frame.origin.y = max(0, ogFrame.origin.y + max(0.0, self.height - contentHeight))
                self.view.frame.size.height = min(
                    contentHeight,
                    self.maxHeight,
                    self.height
                )
                
                self.tableView.reloadData()
                self.tableView.setContentOffset(.zero, animated: false)
                
                
//                UIView.animate(withDuration: self.animationDuration,
//                    delay: 0.0,
//                    options: [.curveEaseIn,.curveEaseOut],
//                    animations: { () -> Void in
//                        self.view.frame.size.height = min(
//                            CGFloat(self.autocompleteItems!.count) * CGFloat(self.cellHeight!),
//                            self.maxHeight,
//                            self.height
//                        )
//                    },
//                    completion: nil)

//                UIView.transition(with: self.tableView,
//                    duration: self.animationDuration,
//                    options: .transitionCrossDissolve,
//                    animations: { () -> Void in
                
                        self.tableView.reloadData()
//                    },
//                    completion: nil)

            } else {
                self.view.isHidden = true
            }
        }
    }

}

