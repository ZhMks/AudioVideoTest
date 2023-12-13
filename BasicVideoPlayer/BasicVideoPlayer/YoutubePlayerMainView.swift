//
//  YoutubePlayerView.swift
//  BasicVideoPlayer
//
//  Created by Максим Жуин on 13.12.2023.
//

import Foundation
import UIKit
import YouTubePlayer


class YoutubePlayerMainView: UIView {

    lazy var youtubePlayer: YouTubePlayerView = {
        let youtubePlayer = YouTubePlayerView()
        youtubePlayer.translatesAutoresizingMaskIntoConstraints = false
        return youtubePlayer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        stupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stupUI() {
        addSubview(youtubePlayer)
        NSLayoutConstraint.activate([
            youtubePlayer.topAnchor.constraint(equalTo: topAnchor),
            youtubePlayer.leadingAnchor.constraint(equalTo: leadingAnchor),
            youtubePlayer.trailingAnchor.constraint(equalTo: trailingAnchor),
            youtubePlayer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
