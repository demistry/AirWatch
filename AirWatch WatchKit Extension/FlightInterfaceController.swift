//
//  FlightInterfaceController.swift
//  AirWatch WatchKit Extension
//
//  Created by David Ilenwabor on 03/05/2020.
//  Copyright © 2020 TQG Digital. All rights reserved.
//

import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {

    @IBOutlet var flightLabel: WKInterfaceLabel!
    @IBOutlet var routeLabel: WKInterfaceLabel!
    @IBOutlet var boardingLabel: WKInterfaceLabel!
    @IBOutlet var boardTimeLabel: WKInterfaceLabel!
    @IBOutlet var statusLabel: WKInterfaceLabel!
    @IBOutlet var gateLabel: WKInterfaceLabel!
    @IBOutlet var seatLabel: WKInterfaceLabel!

    // 1
    var flight: Flight? {
      // 2
      didSet {
        // 3
        guard let flight = flight else { return }
        // 4
        flightLabel.setText("Flight \(flight.shortNumber)")
        routeLabel.setText(flight.route)
        boardingLabel.setText("\(flight.number) Boards")
        boardTimeLabel.setText(flight.boardsAt)
        // 5
        if flight.onSchedule {
          statusLabel.setText("On Time")
        } else {
          statusLabel.setText("Delayed")
          statusLabel.setTextColor(.red)
        }
        gateLabel.setText("Gate \(flight.gate)")
        seatLabel.setText("Seat \(flight.seat)")
      }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let flight = context as? Flight{
            self.flight = flight
        }
    }


}
