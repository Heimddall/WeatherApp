//
//  SettingViewController.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 29.10.23.
//

import UIKit

class SettingViewController: UIViewController {
        
        @IBOutlet weak var velocityTypeSelector: UISegmentedControl!
        
        @IBOutlet weak var pressureTypeSelector: UISegmentedControl!
        
        @IBOutlet weak var precipitationTypeSelector: UISegmentedControl!
        
        @IBOutlet weak var temperatureTypeSelector: UISegmentedControl!
        
        @IBOutlet weak var spaceTypeSelector: UISegmentedControl!
        
        lazy var allSelectors = [velocityTypeSelector,
                                 pressureTypeSelector,
                                 precipitationTypeSelector,
                                 temperatureTypeSelector,
                                 spaceTypeSelector]
        
        weak var settings: Settings!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupSelectors()
            
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            guard let parentVC = presentingViewController as? MainViewController else { return }
            
            parentVC.updateValues()
        }
        
        func setupSelectors() {
            velocityTypeSelector.setTitle(VelocityType.kph.rawValue, forSegmentAt: 0)
            velocityTypeSelector.setTitle(VelocityType.mph.rawValue, forSegmentAt: 1)
            velocityTypeSelector.setTitle(VelocityType.mps.rawValue, forSegmentAt: 2)
            
            pressureTypeSelector.setTitle(PressureType.inches.rawValue, forSegmentAt: 0)
            pressureTypeSelector.setTitle(PressureType.mb.rawValue, forSegmentAt: 1)
            pressureTypeSelector.setTitle(PressureType.mmHg.rawValue, forSegmentAt: 2)
            
            precipitationTypeSelector.setTitle(PrecipitationType.inches.rawValue, forSegmentAt: 0)
            precipitationTypeSelector.setTitle(PrecipitationType.mm.rawValue, forSegmentAt: 1)
            
            temperatureTypeSelector.setTitle(TemperatureType.celsius.rawValue, forSegmentAt: 0)
            temperatureTypeSelector.setTitle(TemperatureType.fahrenheit.rawValue, forSegmentAt: 1)
            
            spaceTypeSelector.setTitle(SpaceType.km.rawValue, forSegmentAt: 0)
            spaceTypeSelector.setTitle(SpaceType.mile.rawValue, forSegmentAt: 1)
            
            updateSelected()
        }
        
        private func updateSelected() {
            chose(settings.velocity.rawValue, in: velocityTypeSelector)
            chose(settings.pressure.rawValue, in: pressureTypeSelector)
            chose(settings.precipitation.rawValue, in: precipitationTypeSelector)
            chose(settings.temperature.rawValue, in: temperatureTypeSelector)
            chose(settings.space.rawValue, in: spaceTypeSelector)
        }
        
        private func chose(_ title: String, in selector: UISegmentedControl) {
            for segment in 0..<selector.numberOfSegments {
                if selector.titleForSegment(at: segment) == title {
                    selector.selectedSegmentIndex = segment
                }
            }
        }
        
        @IBAction func chosedNewType(_ sender: UISegmentedControl) {
            
            switch sender {
            case velocityTypeSelector:
                settings.velocity = VelocityType(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "") ?? settings.velocity
            case pressureTypeSelector:
                settings.pressure = PressureType(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "") ?? settings.pressure
            case precipitationTypeSelector:
                settings.precipitation = PrecipitationType(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "") ?? settings.precipitation
            case temperatureTypeSelector:
                settings.temperature = TemperatureType(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "") ?? settings.temperature
            case spaceTypeSelector:
                settings.space = SpaceType(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "") ?? settings.space
            default: break
            }
        }
        
    }

