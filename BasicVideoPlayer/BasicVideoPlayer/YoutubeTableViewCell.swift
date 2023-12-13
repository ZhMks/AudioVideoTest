//
//  YoutubeTableViewCell.swift
//  BasicVideoPlayer
//
//  Created by Максим Жуин on 11.12.2023.
//

import UIKit
import AVKit
import AVFoundation
import YouTubePlayer


class YoutubeTableViewCell: UITableViewCell {

    let identifier = "YoutubeCell"

    var player: YoutubePlayerMainView?


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "YoutubeCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateCell(withVideo: String?) {
        let player = YoutubePlayerMainView(frame: CGRect(x: 0, y: 0, width: 350, height: 240))
        contentView.addSubview(player)
        guard let url = withVideo else { return }
        if let streamURL = URL.init(string: url) {
            player.youtubePlayer.loadVideoURL(streamURL)
        }
    }
}



