//
//  NoteVIew.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 24/06/2023.
//

import SwiftUI



struct Line {
    var points: [CGPoint] = [CGPoint]()
    var color: Color = .black
    var lineWidth: CGFloat = 1.0
}

struct NoteView: View {
    
    
    @FetchRequest(sortDescriptors: []) var collections: FetchedResults<NoteCollection>
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var textFromNote: String
    @State var showCollections: Bool = false
    @State var text: String = ""
    @FocusState var texting: Bool
    var background: String
    
    
//    @State var saveIn: Bool = false
    @State var toWhatCollectionSave: [NoteCollection] = []
    var savedToWhatCollections: [NoteCollection]
    
//    @State var collectioins = [String]()
//    var notes: [String] = ["Hello World", "Named", "Style", "Collection"]
    
//    init(text: String) {
//
//
//    }
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(background)
                    .ignoresSafeArea()
                VStack {
                    //MARK: -Collections
                    if showCollections
//                        || !collections.isEmpty
                    {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(collections, id: \.id) { collection in
                                    Button {
                                        if !toWhatCollectionSave.contains(collection) {
                                            toWhatCollectionSave.append(collection)
                                        } else {
                                            if let indexToRemove = toWhatCollectionSave.firstIndex(of: collection) {
                                                toWhatCollectionSave.remove(at: indexToRemove)
                                            }
                                        }
                                    } label: {
                                        Text(String(collection.name!))
                                            .lufga(25, .light)
                                            .strokeBackground(padding: 15, cornerRadius: 30)
                                            .foregroundColor(.black)
                                            .opacity(toWhatCollectionSave.contains(collection) ? 1 : 0.5)
                                    }
                                    
                                }
                            }
                            .padding(.horizontal, 15)
                        }
                    }
                    //MARK: -MainTextField
                    TextField("Here comes the text...", text: $text, axis: .vertical)
                        .focused($texting)
                        .foregroundColor(.black)
                        .submitLabel(.return)
                        .lufga(20, .regular)
                        .padding(.horizontal ,20)
                        .padding(.top, 7)
                    
                    
                    Spacer()
                }
                .padding(.top, 20)
                //MARK: -ToolbarItems
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            
                            DispatchQueue.main.async {
                                
                                addNote()
                                
                                try? viewContext.save()
                                print("Saved note to collections - \(toWhatCollectionSave)")
                            }
                            
                        } label: {
                            Image("BackButton")
                                .resizable()
                                .frame(width: 29, height: 28)
                                .offset(x: -1)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 35)
                                    
                                        .fill(.black.opacity(0.2))
                                    
                                    
                                )
                        }
                        
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            withAnimation(.easeInOut(duration: 0.15)) {
                                if texting {
                                    texting.toggle()
                                } else {
                                    showCollections.toggle()
                                }
                            }
                        } label: {
                            Image(texting ? "Tick" : "MenuButton")
                                
                                .resizable()
                                .frame(width: 28, height: 28)
                                .offset(x: -1)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 35)
                                        .fill(.black.opacity(0.2))
                                    
                                )
                                .animation(.default.speed(2.5), value: texting)
                        }
                    }
                }
                .onAppear {
                    self.text = textFromNote
                    self.toWhatCollectionSave = savedToWhatCollections 
                }
            }
        }
    }
    
    private func addNote() {
        let note = Note(context: viewContext)
//        note.id = UUID()
        note.name = firstWordOf(text)
        note.text = text
        note.color = background
        for collection in toWhatCollectionSave {
            collection.addToNotes(note)
        }
    }
}

struct NoteVIew_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(textFromNote: "", background: "PastelGreen", savedToWhatCollections: [])
//            .preferredColorScheme(.dark)
    }
}





func firstWordOf(_ text: String) -> String {
    return text.components(separatedBy: " ").first ?? ""
}



