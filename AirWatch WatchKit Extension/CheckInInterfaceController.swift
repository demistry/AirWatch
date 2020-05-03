//
//  CheckInInterfaceController.swift
//  AirWatch WatchKit Extension
//
//  Created by David Ilenwabor on 03/05/2020.
//  Copyright © 2020 TQG Digital. All rights reserved.
//

import WatchKit
import Foundation


class CheckInInterfaceController: WKInterfaceController {

    @IBOutlet var backgroundGroup: WKInterfaceGroup!
    @IBOutlet var originLabel: WKInterfaceLabel!
    @IBOutlet var destinationLabel: WKInterfaceLabel!
    @IBOutlet weak var buttonGroup: WKInterfaceGroup!
    @IBOutlet weak var buttonCheckInText: WKInterfaceLabel!
    
    var flight: Flight? {
      didSet {
        guard let flight = flight else { return }

        originLabel.setText(flight.origin)
        destinationLabel.setText(flight.destination)
        if flight.checkedIn{
            buttonGroup.setBackgroundColor(UIColor(red: 0.02, green: 0.888, blue: 0.44, alpha: 1))
            buttonCheckInText.setText("Checked In")
//            buttonCheckInText.
        }
      }
    }
    
    override func awake(withContext context: Any?) {
      super.awake(withContext: context)

      if let flight = context as? Flight {
        self.flight = flight
      }
    }

    
    @IBAction func checkInButtonTapped() {
        if flight?.checkedIn ?? false{
            return
        }
      // 1
      let duration = 0.35
      let delay = DispatchTime.now() + (duration + 0.15)
      // 2
      backgroundGroup.setBackgroundImageNamed("Progress")
      // 3
      backgroundGroup.startAnimatingWithImages(in: NSRange(location: 0, length: 10),
        duration: duration,
        repeatCount: 1)
      // 4
      DispatchQueue.main.asyncAfter(deadline: delay) { [weak self] in
        // 5
        self?.flight?.checkedIn = true
        self?.dismiss()
      }
    }



}
