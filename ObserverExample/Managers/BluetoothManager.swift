//
//  BluetoothManager.swift
//  ObserverExample
//
//  Created by Soha Ahmed on 27/05/2020.
//

import Foundation
import CoreBluetooth

protocol bluetoothManager: NSObject, CBCentralManagerDelegate, Provider {

 var bluetoothManager: CBCentralManager { get set }
}
