//
//  ViewController.swift
//  SlotMachine
//
//  Created by Ryan Parman on 2/1/15.
//  Copyright (c) 2015 Ryan Parman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Views
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!

    // Labels
    var titleLabel: UILabel!
    var creditsLabel: UILabel!
    var creditsTitleLabel: UILabel!
    var betLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidLabel: UILabel!
    var winnerPaidTitleLabel: UILabel!

    // Buttons
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var betMaxButton: UIButton!
    var spinButton: UIButton!

    // Constants
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 2.0
    let kThird:CGFloat = 1.0/3.0
    let kHalf:CGFloat = 1.0/2.0
    let kSixth:CGFloat = 1.0/6.0
    let kEighth:CGFloat = 1.0/8.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupContainerViews()
        self.setupFirstContainer(self.firstContainer)
        self.setupSecondContainer(self.secondContainer)
        self.setupThirdContainer(self.thirdContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupContainerViews()  {

        // First
        self.firstContainer = UIView(
            frame: CGRect(
                x: self.view.bounds.origin.x + kMarginForView,
                y: self.view.bounds.origin.y,
                width: self.view.bounds.width - (kMarginForView * 2),
                height: self.view.bounds.height * kSixth
            )
        )
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)

        // Second
        self.secondContainer = UIView(
            frame: CGRect(
                x: self.view.bounds.origin.x + kMarginForView,
                y: firstContainer.frame.height,
                width: self.view.bounds.width - (kMarginForView * 2),
                height: self.view.bounds.height * (3 * kSixth)
            )
        )
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)

        // Third
        self.thirdContainer = UIView(
            frame: CGRect(
                x: self.view.bounds.origin.x + kMarginForView,
                y: firstContainer.frame.height + secondContainer.frame.height,
                width: self.view.bounds.width - (kMarginForView * 2),
                height: self.view.bounds.height * kSixth
            )
        )
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)

        // Fourth
        self.fourthContainer = UIView(
            frame: CGRect(
                x: self.view.bounds.origin.x + kMarginForView,
                y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height,
                width: self.view.bounds.width - (kMarginForView * 2),
                height: self.view.bounds.height * kSixth
            )
        )
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }

    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }

    func setupSecondContainer(containerView: UIView) {
        var containerNumber = 0
        var slotNumber = 0

        for containerNumber; containerNumber < kNumberOfContainers; containerNumber++ {
            for slotNumber; slotNumber < kNumberOfSlots; slotNumber++ {
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRect(
                    x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird),
                    y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird),
                    width: containerView.bounds.width * kThird - kMarginForSlot,
                    height: containerView.bounds.height * kThird - kMarginForSlot
                )
                containerView.addSubview(slotImageView)
            }
        }
    }

    func setupThirdContainer(containerView: UIView) {
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPoint(
            x: containerView.frame.width * kSixth,
            y: containerView.frame.height * kThird
        )
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.creditsLabel)

        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 3,
            y: containerView.frame.height * kThird
        )
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betLabel)

        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 5,
            y: containerView.frame.height * kThird
        )
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winnerPaidLabel)

        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth,
            y: containerView.frame.height * kThird * 2
        )
        containerView.addSubview(self.creditsTitleLabel)

        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 3,
            y: containerView.frame.height * kThird * 2
        )
        containerView.addSubview(self.betTitleLabel)

        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "Winner Paid"
        self.winnerPaidTitleLabel.textColor = UIColor.blackColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPoint(
            x: containerView.frame.width * 5 * kSixth,
            y: containerView.frame.height * 2 * kThird
        )
        containerView.addSubview(self.winnerPaidTitleLabel)
    }

    func setupFourthContainer (containerView: UIView) {
        self.resetButton = UIButton()
        self.resetButton.setTitle(
            "Reset",
            forState: UIControlState.Normal
        )
        self.resetButton.setTitleColor(
            UIColor.blueColor(),
            forState: UIControlState.Normal
        )
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.resetButton.backgroundColor = UIColor.lightGrayColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPoint(
            x: containerView.frame.width * kEighth,
            y: containerView.frame.height * kHalf
        )
        self.resetButton.addTarget(
            self,
            action: "resetButtonPressed:",
            forControlEvents: UIControlEvents.TouchUpInside
        )
        containerView.addSubview(self.resetButton)
    }

    // IBAction
    func resetButtonPressed(button: UIButton) {
        println("resetButtonPressed")
    }
}
