//
//  useModel.swift
//  jsonDataFetching
//
//  Created by Xelpmoc Mac on 27/05/20.
//  Copyright © 2020 Xelpmoc Mac. All rights reserved.
//

import Foundation
class User {

  var useringurl: [String]
  var name: [String]
  var age: [String]
  var location: [String]

  init(useringurl: [String],name: [String],age: [String],location: [String]) {
    self.useringurl = useringurl
    self.name = name
    self.age = age
    self.location = location
  }

}
