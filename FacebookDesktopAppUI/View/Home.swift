//
//  Home.swift
//  FacebookDesktopAppUI
//
//  Created by Nich on 2022/08/24.
//

import SwiftUI

struct Home: View {
    
    // Screen...
    var screen = NSScreen.main!.visibleFrame
    
    @State var selected = "house.fill"
    @Namespace var animation
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                HStack {
                    
                    Text("Facebook")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.blue)
                        
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        HStack {
                            Image(systemName: "star")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.orange.opacity(0.5))
                                .clipShape(Circle())
                            
                            Text("Alaxhenry")
                                .foregroundColor(.black)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.leading, 8)
                    
                    Button{
                        
                    } label: {
           
                        Image(systemName: "timelapse")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(Color.pink.opacity(0.6))
                            .clipShape(Circle())
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.vertical)
                .padding(.leading, 10)
                .padding(.trailing)
                .padding(.top, 30)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 5)
                
                // TabView
                
                HStack {
                    
                    TabButton(image: "house.fill", selected: $selected, animation: animation)
                    
                    TabButton(image: "play.tv", selected: $selected, animation: animation)
                    
                    TabButton(image: "person.circle", selected: $selected, animation: animation)
                    
                    TabButton(image: "person.3.fill", selected: $selected, animation: animation)
                    
                    TabButton(image: "bell", selected: $selected, animation: animation)
                    
                    TabButton(image: "line.horizontal.3", selected: $selected, animation: animation)
                }
            }
            
            HStack {
                
                // Side Views....
                SideTabView()
                
                // Post View...
                PostView()
                
                // Side Contact Views....
                ContactView()
                
            }
            .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.4, height: screen.height - 60)
        .background(Color.white)
        .preferredColorScheme(.light)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PostView: View {
    
    @State var post = ""
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                // My Post View....
                VStack {
                    
                    HStack {
                        
                        Image("alaxhenry")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        
                        TextField("What's in your Mind", text: $post)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    
                    Divider()
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Label {
                                Text("Live")
                                    .foregroundColor(.black)
                            } icon: {
                                Image(systemName: "video.fill")
                                    .foregroundColor(.red)
                            }
                            .frame(maxWidth: .infinity)

                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Divider()
                            .padding(.vertical, -5)
                        
                        Button {
                            
                        } label: {
                            Label {
                                Text("Photos")
                                    .foregroundColor(.black)
                            } icon: {
                                Image(systemName: "photo.on.rectangle")
                                    .foregroundColor(.green)
                            }
                            .frame(maxWidth: .infinity)

                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Divider()
                            .padding(.vertical, -5)
                        
                        Button {
                            
                        } label: {
                            Label {
                                Text("Room")
                                    .foregroundColor(.black)
                            } icon: {
                                Image(systemName: "video.fill.badge.plus")
                                    .foregroundColor(.purple)
                            }
                            .frame(maxWidth: .infinity)

                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button {
                            
                        } label: {
                            Label {
                                Text("Create Room")
                            } icon: {
                                Image(systemName: "video.badge.plus")
                                    .foregroundColor(.purple)
                            }
                            .padding(10)
                            .background(
                                Capsule()
                                    .strokeBorder(Color.purple)
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        ForEach(users) { user in
                            
                            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                                
                                AsyncImage(url: URL(string: user.url)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 10, height: 10)
                            }
                        }
                        
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(10)
                
                ForEach(posts){ post in
                    
                    // Post View...
                    PostCardView(post: post)
                }
            }
            .padding()
        }
        .shadow(radius: 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TabButton: View {
    
    var image: String
    @Binding var selected: String
    var animation: Namespace.ID
    
    var body: some View {
        
        Button{
            withAnimation {
                selected = image
            }
        } label: {
            
            VStack(spacing: 0) {
                
                Image(systemName: image)
                    .font(.title)
                    .foregroundColor(selected == image ? Color.blue : Color.gray.opacity(0.7))
                    .frame(height: 40)
                
                ZStack {
                    
                    Capsule()
                        .fill(Color.clear)
                        .frame(width: 65, height: 3)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                    
                    if selected == image {
                        
                        Capsule()
                            .fill(Color.blue)
                            .frame(width: 65, height: 3)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SideTabButton: View {
    
    var image: String
    var title: String
    var color: Color
    var isSystem: Bool
    
    var body: some View {
        
        Button {
            
        } label: {
            HStack(spacing: 8) {
                
                if isSystem {
                    
                    Image(systemName: image)
                        .font(.system(size: 25))
                        .foregroundColor(color)
                        .frame(width: 25)
                } else {
                    Image(image)
                        .resizable()
                        .renderingMode(color == .clear ? .original : .template)
                        .foregroundColor(color)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
                
                Text(title)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SideTabView: View {
    var screen = NSScreen.main!.visibleFrame
    var body: some View {
        VStack(spacing: 18) {
            
            // Contact Buttons...
            SideTabButton(image: "alaxhenry", title: "Alaxhenry", color: .clear, isSystem: false)
                .padding(.top, 20)
            
            SideTabButton(image: "shield.checkerboard", title: "Covid 19 Info Center", color: .blue, isSystem: true)
            
            SideTabButton(image: "person.2", title: "Friends", color: .teal, isSystem: true)
            
            SideTabButton(image: "message.fill", title: "Messenger", color: .pink, isSystem: true)
            
            SideTabButton(image: "flag.fill", title: "Pages", color: .orange, isSystem: true)
            
            SideTabButton(image: "cart.fill", title: "MarketPlace", color: .purple, isSystem: true)
            
            SideTabButton(image: "play.tv", title: "Watch", color: .blue, isSystem: true)
            
            SideTabButton(image: "calendar", title: "Event", color: .red, isSystem: true)
            
            Spacer()
        }
        .background(.white)
        .frame(maxWidth: (screen.width / 1.8) / 4, maxHeight: .infinity)
    }
}

struct ContactView: View {
    var screen = NSScreen.main!.visibleFrame
    var body: some View {
        VStack {
            HStack {
                // Side Tabs Views...
                Text("Contacts")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
                .buttonStyle(PlainButtonStyle())
                
                Button {
                    
                } label: {
                    Image(systemName: "slider.vertical.3")
                        .foregroundColor(.gray)
                }
                .buttonStyle(PlainButtonStyle())
                
            }
            .padding()
            
            ScrollView {
                
                // Contacts....
                ForEach(users) { user in
                    
                    HStack {
                        
                        AsyncImage(url: URL(string: user.url)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                            
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text(user.name)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                }
            }
        }
        .frame(maxWidth: (screen.width / 1.8) / 4, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct PostCardView: View {
    
    var post: Post
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                AsyncImage(url: URL(string: post.user.url)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(post.user.name)
                        .foregroundColor(.black)
                    
                    HStack(spacing: 5) {
                        
                        Text(post.postTime)
                            .foregroundColor(.gray)
                        
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 3, height: 3)
                        
                        Image(systemName: "globe")
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "ellipsis")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.black)
                        .rotationEffect(.init(degrees: 90))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 10)
            
            Text(post.title)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
            
            AsyncImage(url: URL(string: post.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                ProgressView()
            }
            
            HStack {
                
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.blue)
                
                Text("\(post.likes)")
                
                Spacer()
                
                Text("\(post.comments) Comments")
                    .foregroundColor(.gray)
                
                Text("\(post.shares) Shares")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 10)
            .padding(.top, 5)
            
            Divider()
            
            HStack {
                Button {
                    
                } label: {
                    Label {
                        Text("Like")
    
                    } icon: {
                        Image(systemName: "hand.thumbsup")
    
                    }
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)

                }
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                    .padding(.vertical, -5)
                
                Button {
                    
                } label: {
                    Label {
                        Text("Comment")
    
                    } icon: {
                        Image(systemName: "arrow.up.message")
    
                    }
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)

                }
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                    .padding(.vertical, -5)
                
                Button {
                    
                } label: {
                    Label {
                        Text("Like")
    
                    } icon: {
                        Image(systemName: "square.and.arrow.up")
    
                    }
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)

                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(10)
    }
}
