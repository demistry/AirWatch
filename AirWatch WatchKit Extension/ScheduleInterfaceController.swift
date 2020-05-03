//
//  ScheduleInterfaceController.swift
//  AirWatch WatchKit Extension
//
//  Created by David Ilenwabor on 03/05/2020.
//  Copyright © 2020 TQG Digital. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {

    @IBOutlet weak var flightsTable: WKInterfaceTable!
    var flights = Flight.allFlights()

    
    override func awake(withContext context: Any?) {
      super.awake(withContext: context)
      flightsTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
    }

}
