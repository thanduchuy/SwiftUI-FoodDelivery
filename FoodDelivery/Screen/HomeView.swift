//
//  HomeView.swift
//  FoodDelivery
//
//  Created by than.duc.huy on 04/05/2021.
//

import SwiftUI

struct HomeView: View {
    let items = [Bottles(id: 1, image: "bottles1", name: "Fresh Juice", description: "apple juice glass", totalPrice: 520, volume: 200, rate: 4, color: "blue"),
                 Bottles(id: 2, image: "bottles2", name: "Fresh Juice", description: "orange juice glass", totalPrice: 230, volume: 200, rate: 3, color: "yellow"),
                 Bottles(id: 3, image: "bottles3", name: "Fresh Juice", description: "melon juice glass", totalPrice: 160, volume: 120, rate: 2, color: "red"),
                 Bottles(id: 4, image: "bottles4", name: "Fresh Juice", description: "banana juice glass", totalPrice: 300, volume: 430, rate: 3, color: "blue")]
    
    @State var selectJuice = Bottles(id: 4, image: "bottles4", name: "Fresh Juice", description: "banana juice glass", totalPrice: 300, volume: 430, rate: 3, color: "blue")
    @State var detail = false
    
    var body: some View {
        VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20, weight: .semibold))
            
                            Spacer()
            
                            Image("haitu")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFit()
                                .clipShape(Circle())
                        }
                        .padding()
            
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 10) {
                                Text("Delicious Juice")
                                    .font(.system(size: 36, weight: .bold))
            
                                Image("hearts")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .scaledToFit()
                                    .clipShape(Circle())
                            }
            
                            Text("Food has an imesistible beauty")
                                .font(.system(size: 14, weight: .light))
                                .foregroundColor(.gray)
                        }
                        .padding([.horizontal, .bottom])
            
                        LazyVGrid(columns: [GridItem(.flexible()),
                                            GridItem(.flexible())],
                                  spacing: 10) {
                            ForEach(items, id: \.self) { item in
                                VStack(alignment: .center, spacing: 5) {
                                    Image(item.image)
                                        .resizable()
                                        .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .rotationEffect(.degrees(-25))
                                        .background(
                                            Color(item.color)
                                                .clipped()
                                                .clipShape(Circle())
                                                .padding(15)
                                                .offset(x: 5.0, y: 25.0)
                                        )
            
                                    Text(item.name)
                                        .font(.headline)
                                        .padding(.leading, 5)
                                        .padding(.top, 15)
            
                                    Text(item.description)
                                        .font(.system(size: 10, weight: .light))
                                        .foregroundColor(.gray)
                                        .padding(.leading, 5)
            
                                }
                                .padding()
                                .onTapGesture {
                                    selectJuice = item
                                    detail.toggle()
                                }
                            }
                        }
            Spacer()
        }
        .fullScreenCover(isPresented: $detail) {
            DetailView(item: selectJuice)
        }
        .animation(.default)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
