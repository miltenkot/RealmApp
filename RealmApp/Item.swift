//
//  Item.swift
//  RealmApp
//
//  Created by Bartek Lanczyk on 08.01.2018.
//  Copyright © 2018 miltenkot. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object{
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
}
