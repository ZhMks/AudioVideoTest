//
//  RecordViewController.swift
//  AVFoundation_Audio
//
//  Created by Максим Жуин on 14.12.2023.
//

import UIKit
import AVFoundation
import AVKit

class RecordViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordButton: UIButton!

    @IBOutlet weak var playButton: UIButton!

    var player = AVAudioPlayer()

    var audioRecorder: AVAudioRecorder!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        recordButton.addTarget(self, action: #selector(recordTapped(_:)), for: .touchUpInside)
    }


    func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.playAndRecord, mode: .default, options: [])
        let audioURL = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ] as [String : Any]
        do {
            audioRecorder = try AVAudioRecorder(url: audioURL, settings: settings)
            audioRecorder.prepareToRecord()
            audioRecorder.delegate = self
            audioRecorder.record()

            recordButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)

        } catch {
            finishRecording(success: false)
        }
    }

    @IBAction func playButtonTapped(_ sender: UIButton) {
        do {
            player = try AVAudioPlayer(contentsOf: getDocumentsDirectory().appendingPathComponent("recording.m4a"))
            player.prepareToPlay()
            player.play()
        } catch {
            print(error.localizedDescription)
        }
    }

    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }

    @objc func recordTapped(_ sender: UIButton) {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }

    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil

        if success {
            recordButton.setImage(UIImage(systemName: "play.square"), for: .normal)
        } else {
            recordButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        }
    }
}
