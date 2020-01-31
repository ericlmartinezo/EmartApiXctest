//
//  PortlandWeatherHelper.swift
//  EmartApiXctestTests
//
//  Created by Eric Martinez on 1/31/20.
//  Copyright © 2020 emobile. All rights reserved.
//

import Foundation
import XCTest

enum NoaaPortlandUrl: String {
    case urlPortlandUrl = "http://forecast.weather.gov/MapClick.php?lat=45.5361588&lon=-122.8328414&FcstType=json"
}

enum PortlandLocationKey: String {
    case portlandRegion = "region"
    case portlandWFO = "wfo"
    case portlandZone = "zone"
    case portlandAreaDescription = "areaDescription"
}

enum PortlandLocationValue: String {
    case regionValue = "wrh"
    case wfoValue = "PQR"
    case zoneValue = "ORZ006"
    case areaDescription = "3 Miles NNW Cedar Hills OR"
}
