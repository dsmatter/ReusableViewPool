//
//  ReusableViewPool.swift
//  script
//
//  Created by Daniel Strittmatter on 02/02/16.
//
//

import Foundation

/**
 Caches UIView objects for later reuse.
*/
public class ReusableViewPool<T: UIView> {
  
  public var maxSize = 20
  public var createNew: () -> T = { T() }
  
  private var views = [T]()
  
  public required init() {
  }
  
  public func popOrCreate() -> T {
    return pop() ?? createNew()
  }
  
  public func pop() -> T? {
    return views.popLast()
  }
  
  public func push(view: T) {
    view.removeFromSuperview()
    
    if views.count < maxSize {
      views.append(view)
    }
  }
  
}
