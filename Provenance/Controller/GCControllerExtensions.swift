//
//  GCControllerExtensions.swift
//  Provenance
//
//  Created by Sev Gerk on 1/27/19.
//  Copyright © 2019 Provenance Emu. All rights reserved.
//

import GameController

extension GCController {
    func supportsThumbstickButtons() -> Bool {
        if #available(iOS 12.1, tvOS 12.1, *) {
            let controller = self.extendedGamepad
            return (controller!.responds(to: #selector(getter: GCExtendedGamepad.leftThumbstickButton))) && controller!.leftThumbstickButton != nil
        } else {
            // Fallback on earlier versions
        }
        return false
    }
}

extension GCExtendedGamepad {
    func getButtonHome() -> GCControllerButtonInput? {
        if #available(iOS 14.0, *) {
            if self.responds(to: Selector("buttonHome")) {
                if let buttonHome = self.perform(Selector("buttonHome")) {
                    return buttonHome.takeUnretainedValue() as? GCControllerButtonInput
                }
            }
        }
        return nil
    }
}
