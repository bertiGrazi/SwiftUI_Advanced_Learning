//
//  FileManagerBootcamp.swift
//  SwiftUI_Advanced_Learning
//
//  Created by Grazi  Berti on 08/02/24.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name) else {
            print("Error getting data.")
            return
        }
                
        do {
            try data.write(to: path)
            print("Sucess saving")
        } catch let error {
            print("Error saving \(error)")
        }
    }
    
    func getImage(name: String) -> UIImage?{
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path.")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent("\(name).jpg") else {
            return nil
        }
        
        return path
    }
 }

class FileManagerViewModel:  ObservableObject {
    
    @Published var image: UIImage? = nil
    
    let imageName: String = "beyonce"
    let manager = LocalFileManager.instance
    
    init() {
        //getImageFromAssetsFolder()
        getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else { return }
        manager.saveImage(image: image, name: imageName)
    }
}

struct FileManagerBootcamp: View {
    @StateObject var viewModel = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                    
                    Button {
                        viewModel.saveImage()
                    } label: {
                        Text("Save to FM")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                    }

                    
                    Spacer()
                }
            }
            .navigationTitle("File Manager")
            
        }
    }
}

#Preview {
    FileManagerBootcamp()
}
