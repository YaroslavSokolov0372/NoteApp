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
//    @Binding var isPresented: Boo
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var collections: FetchedResults<NoteCollection>
    var notes: [String] = ["Hello World", "Named", "Style", "Collection"]
    
    @State var currentLine = Line()
    @State var lines: [Line] = []
    
    
    
    @StateObject var noteVM: noteViewModel = noteViewModel()
    var backgroundColor: Color
    
    @State var showPlus = true
    @State var showCollections: Bool = false

    
    var body: some View {
        NavigationView {
            
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView(.vertical) {
                        if showCollections {
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(notes, id: \.self) { note in
                                        Button {
                                            
                                        } label: {
                                            Text(String(note))
                                                .lufga(25, .light)
                                                .foregroundColor(.white)
                                            
                                        }
                                        .strokeBackground(padding: 15, cornerRadius: 30)
                                    }
                                }
                                .padding(.leading, 15)
                                //                            .offset(y: showCollections ? 0 : -40)
                                //                        .animation(Animation.default.delay(3), value: showCollections)
                                
                                //                        .transition(.move(edge: .top))
                                //                        .id("one")
                            }
                        }
                        
                        TextField("Here comes text...", text: $noteVM.text, axis: .vertical)
                            .submitLabel(.return)
                            .lufga(20, .regular)
                            .padding(20)
                        
                        Spacer()
                    }
                    .padding(.top, 30)
                }
                .zIndex(noteVM.activeTool == .pencil ? 0 : 1)
                
                Canvas { context, size in

                    for line in lines {
                        var path = Path()

                        path.addLines(line.points)
                        context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                    }
                }
                .gesture(DragGesture(minimumDistance: 0.8, coordinateSpace: .named("ZStack"))
                    .onChanged({ value  in
                        let newPoint = value.location
                        currentLine.points.append(newPoint)
                        self.lines.append(currentLine)
                    })
                        .onEnded({  value in
                            self.lines.append(currentLine)
                            self.currentLine = Line(points: [])
                        }))
                
                .disabled(noteVM.activeTool == .pencil ? false : true)
                .zIndex(noteVM.activeTool == .pencil ? 1 : 0)
            }
            .coordinateSpace(name: "ZStack")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("BackButton")
                            .resizable()
                            .frame(width: 33, height: 30)
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
                            showCollections.toggle()
                        }
                    } label: {
                        Image("MenuButton")
                            .resizable()
                            .frame(width: 33, height: 30)
                            .offset(x: -1)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(.black.opacity(0.2))
                                
                            )

                    }
                }
                ToolbarItem(placement: .bottomBar) {
//                    CustomToolBar(activeItem: $noteVM.activeTool)
                    PencilToolBarItem()
                }
                
            }
        }
    }
}

struct NoteVIew_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(backgroundColor: Color.gray.opacity(0.2))
//            .preferredColorScheme(.dark)
    }
}



//                HStack {
//                    TextEditor( text: $noteVM.text)
//                        .lufga(30, noteVM.shouldBold ? .bold : .regular)
//                        .scrollContentBackground(.hidden)
//                        .onSubmit {
//                            noteVM.shouldBold = false
//                        }
//                        .frame(width: 300, height: .infinity)
//                }
//                .padding(.top)



//                    ScrollView(.vertical, showsIndicators: false) {
//                        ForEach(notesElement, id: \.id) { view in
//                            AnyView(view)
//                                .background(backgroundColor)
//                        }
//                        CustomToolBar(activeItem: $noteVM.activeTool)
//                            .padding(.top, 30)
//                    }
