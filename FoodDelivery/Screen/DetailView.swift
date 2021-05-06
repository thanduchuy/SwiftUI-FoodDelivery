//
//  DetailView.swift
//  FoodDelivery
//
//  Created by than.duc.huy on 04/05/2021.
//

import SwiftUI

struct DetailView: View {
    var item: Bottles
    @Environment(\.presentationMode) var presentationMode
    @State var colors = [Color("red"), Color("yellow"), Color("blue")]
    @State var selectOption = 0
    
    var body: some View {
        ZStack() {
            VStack {
                HStack {
                    Spacer()

                    Color(item.color)
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 3)
                        .cornerRadius(50)
                        .offset(x: 50)
                        .opacity(0.7)
                }

                Spacer()
            }
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                    })

                    Spacer()

                    Image(systemName: "cart")
                        .font(.system(size: 20, weight: .semibold))
                }
                .padding()
                
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(item.name)
                            .font(.system(size: 40, weight: .bold))
                            .fixedSize(horizontal: false, vertical: true)

                        Text(item.description + "\n" + item.description + "\n" + item.description)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system(size: 15, weight: .thin))

                        HStack {
                            Text("Total Price")
                                .font(.system(size: 15, weight: .thin))

                            Spacer()

                            Text("\(item.volume) ML")
                                .font(.system(size: 15, weight: .thin))
                        }

                        HStack {
                            Text("$ \(item.totalPrice)")
                                .font(.system(size: 20))

                            Spacer()

                            HStack {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 14))
                                    .foregroundColor(.yellow)

                                Text("\(item.rate)/5")
                                    .font(.system(size: 20))
                            }
                        }

                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            HStack {
                                Spacer()

                                Text("Add To Basket")
                                    .font(.system(size: 12))
                                    .foregroundColor(.black)

                                Spacer()
                            }
                        })
                        .padding()
                        .background(Color(item.color))
                        .clipShape(Capsule())
                        .shadow(color: Color(item.color), radius: 20, x: 10.0, y: 10.0)
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack {
                        Image(item.image)
                            .resizable()
                            .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .shadow(color: Color(item.color), radius: 20, x: 10.0, y: 10.0)
                        
                        HStack(spacing: 10) {
                            ForEach(0..<colors.count, id: \.self) { index in
                                ZStack {
                                    Circle()
                                        .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(colors[index])
                                    
                                    if index == selectOption {
                                        Circle()
                                            .stroke()
                                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectOption = index
                                    }
                                }
                            }
                        }
                        .padding(.top, 20)
                    }
                    .padding(.top, 20)
                    .padding()
                }
                
                Spacer()
            }
            .padding(.top , 20)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            selectOption = colors.firstIndex(of: Color(item.color)) ?? 0
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Bottles(id: 3, image: "bottles3", name: "Fresh Juice", description: "melon juice glass", totalPrice: 160, volume: 120, rate: 2, color: "red"))
    }
}
