//
//  User.swift
//  FacebookDesktopAppUI
//
//  Created by Nich on 2022/08/24.
//

import Foundation
import SwiftUI

// Model And Sample Data...

struct User: Identifiable {
    var id = UUID().uuidString
    var name: String
    var url: String
}

let users = [
    User(
        name: "Ariana Grande",
        url: "https://www.biography.com/.image/t_share/MTQ3MzM3MTcxNjA5NTkzNjQ3/ariana_grande_photo_jon_kopaloff_getty_images_465687098.jpg"
    ),
    User(
        name: "Beyonce",
        url: "https://www.billboard.com/wp-content/uploads/2022/07/beyonce-press-2022-cr-parkwood-entertaiment-billboard-1548.jpg?w=942&h=623&crop=1"
    ),
    User(
        name: "Steve Harvey",
        url: "https://hips.hearstapps.com/hmg-prod/images/steve-harvey-net-worth-1557432119.jpg?crop=0.685xw:0.910xh;0.0709xw,0.0529xh&resize=640:*"
    ),
    User(
        name: "Barack Obama",
        url: "https://www.biography.com/.image/t_share/MTE4MDAzNDEwNzg5ODI4MTEw/barack-obama-12782369-1-402.jpg"
    ),
    User(
        name: "Donald Trump",
        url: "https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg"
    ),
    User(
        name: "Barack Obama",
        url: "https://www.biography.com/.image/t_share/MTE4MDAzNDEwNzg5ODI4MTEw/barack-obama-12782369-1-402.jpg"
    ),
    User(
        name: "Michael Jackson",
        url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTP5OCcPXVq3wYcWJPxupOvFJyUTAB7wL7F5A&usqp=CAU"
    ),
    User(
        name: "Christiano Ronaldo",
        url: "https://resources.premierleague.com/photos/2022/02/11/b131e212-5275-4ed4-8a9a-937a746d6cd3/ronaldo.png?width=930&height=620"
    ),
    User(
        name: "Ronaldo Luis Nazario",
        url: "https://www.si.com/.image/c_fit%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_620/MTc5NTMwMzAxNjQ1NTMwMjQ5/gettyimages-891445.jpg"
    ),
    User(
        name: "Lionel Messi",
        url: "https://s.yimg.com/ny/api/res/1.2/.kp3G56EgKng9O3czuw0AQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQyNw--/https://s.yimg.com/os/creatr-uploaded-images/2022-10/1f116ac0-45ac-11ed-b7df-6b3184274670"
    ),
    User(
        name: "David Beckham",
        url: "https://ss-i.thgim.com/public/third-party/opta/article29323340.ece/alternates/FREE_1200/david-beckham-croppedhu92kyyc7ezm129vwdrkpos5tjpg"
    ),
    User(
        name: "Ronaldinho",
        url: "https://upload.wikimedia.org/wikipedia/commons/e/e8/Ronaldinho_in_2019.jpg"
    ),
]

// Post Model and Data....

struct Post: Identifiable {
    
    var id = UUID().uuidString
    var user: User
    var imageURL: String
    var title: String
    var likes: String
    var shares: String
    var comments: String
    var postTime: String
}

let posts = [
    Post(user: users[0], imageURL: "https://uknow.uky.edu/sites/default/files/styles/uknow_story_image/public/GettyImages-1160947136%20%281%29.jpg", title: "Summer Vacation :)))", likes: "89", shares: "22", comments: "17", postTime: "58"),
    Post(user: users[1], imageURL: "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg", title: "Cutties 🥰", likes: "192", shares: "27", comments: "37", postTime: "23"),
    Post(user: users[2], imageURL: "https://uknow.uky.edu/sites/default/files/styles/uknow_story_image/public/GettyImages-1160947136%20%281%29.jpg", title: "Enjoy Corona Times 🔥", likes: "77", shares: "12", comments: "45", postTime: "15"),
    Post(user: users[3], imageURL: "https://designcompass.org/wp-content/uploads/2022/10/ventura-cover.png", title: "Ventura 💻", likes: "77", shares: "12", comments: "45", postTime: "15"),
    Post(user: users[4], imageURL: "https://m.media-amazon.com/images/I/91uylFCg2yL._SL1500_.jpg", title: "My New ArtWork !!! 🔥", likes: "314", shares: "88", comments: "55", postTime: "46"),
    Post(user: users[5], imageURL: "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTQ3MzM3MTcxNjA5NTkzNjQ3/ariana_grande_photo_jon_kopaloff_getty_images_465687098.jpg", title: "Ariana Grande !!! 💘", likes: "4120", shares: "1201", comments: "755", postTime: "43")
]
