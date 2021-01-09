//
//  Coordinator.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import Foundation
import SwiftUI

protocol BaseCoordinator: AssociatedObject {
    func stop()
}

extension BaseCoordinator {
    fileprivate(set) var identifier: UUID {
        get {
            guard let identifier: UUID = associatedObject(for: &identifierKey) else {
                self.identifier = UUID()
                return self.identifier
            }
            return identifier
        }
        set { setAssociatedObject(newValue, for: &identifierKey) }
    }
    
    fileprivate(set) var children: [UUID: BaseCoordinator] {
        get {
            guard let children: [UUID: BaseCoordinator] = associatedObject(for: &childrenKey) else {
                self.children = [UUID: BaseCoordinator]()
                return self.children
            }
            return children
        }
        set { setAssociatedObject(newValue, for: &childrenKey) }
    }
    
    fileprivate func store<T: Coordinator>(child coordinator: T) {
        children[coordinator.identifier] = coordinator
    }
    
    fileprivate func free<T: Coordinator>(child coordinator: T) {
        children.removeValue(forKey: coordinator.identifier)
    }
}

protocol Coordinator: BaseCoordinator {
    associatedtype V: View
    associatedtype C: Coordinator
    func start() -> V
    func shouldStop()
}

extension Coordinator {
    private(set) weak var parent: C? {
        get { associatedObject(for: &childrenKey) }
        set { setAssociatedObject(newValue, for: &childrenKey, policy: .weak) }
    }
    
    func coordinate<T: Coordinator>(to coordinator: T) -> some View {
        store(child: coordinator)
        coordinator.parent = self as? T.C
        return coordinator.start()
    }
    
    func stop() {
        children.removeAll()
        parent?.free(child: self)
    }
    
    func shouldStop() {
        stop()
    }
}

private var identifierKey: UInt8 = 0
private var childrenKey: UInt8 = 0
private var parentKey: UInt8 = 0
