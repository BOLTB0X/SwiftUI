//
//  TimerManager.swift
//  WorkoutLiveWidgetPOC
//
//  Created by KyungHeon Lee on 2024/04/24.
//

import SwiftUI
import AVFoundation
import MediaPlayer

class TimerManager: ObservableObject {
    static let shared = TimerManager()
    
    @Published var isRunning = false
    @Published var elapsedTime: TimeInterval = 0
    
    private var timer: Timer?
    private let interval: TimeInterval = 1 // 타이머 간격 (초)
    
    init() {
        setupRemoteTransportControls()
    }
    
    func startTimer() {
        guard timer == nil else { return }
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            self?.elapsedTime += self?.interval ?? 0
        }
        timer?.tolerance = 0.1 // 타이머 정확도를 높임
    }
    
    func pauseTimer() {
        guard isRunning else { return }
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func resumeTimer() {
        guard !isRunning else { return }
        startTimer()
    }
    
    func stopTimer() {
        isRunning = false
        elapsedTime = 0
        timer?.invalidate()
        timer = nil
    }
    
    private func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        
        commandCenter.playCommand.addTarget { [weak self] event in
            self?.startTimer()
            return .success
        }
        
        commandCenter.pauseCommand.addTarget { [weak self] event in
            self?.pauseTimer()
            return .success
        }
        
        commandCenter.stopCommand.addTarget { [weak self] event in
            self?.stopTimer()
            return .success
        }
    }
}
