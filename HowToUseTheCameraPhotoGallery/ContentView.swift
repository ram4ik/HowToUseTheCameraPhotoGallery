    //
//  ContentView.swift
//  HowToUseTheCameraPhotoGallery
//
//  Created by Ramill Ibragimov on 12.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var image: Image? = nil
    @State var showingImagePicker = false
    
    var body: some View {
        VStack {
            if image == nil {
                Image(systemName: "person.fill")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color.red, lineWidth: 5))
                    .foregroundColor(Color.purple)
            } else {
                image?
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color.red, lineWidth: 5))
                    .foregroundColor(Color.purple)
            }
            Button("Put Your Face Here") {
                self.showingImagePicker.toggle()
            }
        }.sheet(isPresented: $showingImagePicker, content: {
            ImagePicker.shared.view
        }).onReceive(ImagePicker.shared.$image) {
            image in self.image = image
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
