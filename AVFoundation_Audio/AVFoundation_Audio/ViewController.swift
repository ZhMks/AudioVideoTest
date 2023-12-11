//
//  ViewController.swift
//  AVFoundation_Audio
//
//  Created by Niki Pavlove on 18.02.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
   @IBOutlet var nameLable: UILabel!

   private var arrayOfTracks: [URL]? = []

   private var index = 0

   private var Player = AVAudioPlayer()

    @IBOutlet weak var netxtButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.netxtButton.setImage(UIImage(systemName: "forward.end.fill"), for: .normal)
        self.previousButton.setImage(UIImage(systemName: "backward.end.fill"), for: .normal)
    }

    override func viewDidLoad() {
        updateArray()
        Player.prepareToPlay()
        super.viewDidLoad()
    }

    @IBAction func PlayButton(_ sender: Any) {
        checkPlayer()
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let tracks = arrayOfTracks else { return }
        if index < tracks.count - 1 {
            index += 1
            print(index, tracks.count)
            playAudio(track: tracks[index])
        } else {
            playAudio(track: tracks[index])
        }
    }
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        guard let tracks = arrayOfTracks else { return }
        if index < tracks.count - 1 && index != 0 {
            index -= 1
            playAudio(track: tracks[index])
        } else if index == 0 {
            playAudio(track: tracks[index])
        } else {
            index -= 1
            playAudio(track: tracks[index])
        }
    }

    @IBAction func StopButton(_ sender: Any) {
        Player.stop()
        Player.currentTime = 0.0
        nameLable.text = ""
    }


    func updateArray() {
        arrayOfTracks?.append(URL.init(fileURLWithPath: Bundle.main.path(forResource: "Queen",
                                                                         ofType: "mp3")!))
        arrayOfTracks?.append(URL.init(fileURLWithPath: Bundle.main.path(forResource: "ROSALÍA, Travis Scott - TKN",
                                                                         ofType: "mp3")!))
        arrayOfTracks?.append(URL.init(fileURLWithPath: Bundle.main.path(forResource: "Travis Scott - ESCAPE PLAN",
                                                                         ofType: "mp3")!))
        arrayOfTracks?.append(URL.init(fileURLWithPath: Bundle.main.path(forResource: "Travis Scott feat. Young Thug, M.I.A. - FRANCHISE",
                                                                         ofType: "mp3")!))
    }

    func checkPlayer() {
        switch Player {
        case (let x) where x.isPlaying:
            Player.stop()
        case (let x) where !x.isPlaying:
            playAudio(track: arrayOfTracks![index])
            nameLable.text = Player.url?.lastPathComponent
            nameLable.numberOfLines = 0
        default: break
        }
    }

    func playAudio(track: URL) {
        do {
            Player = try AVAudioPlayer(contentsOf: track)
            nameLable.text = Player.url?.lastPathComponent
            Player.play()
        } catch {
            print(error)
        }
    }
}
