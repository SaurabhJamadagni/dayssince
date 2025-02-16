//
//  EventListView.swift
//  DaysSince
//
//  Created by Vicki Minerva on 4/7/22.
//

import SwiftUI

struct EventListItemView: View {
    var item: DaysSinceItem
    @Binding var editItemSheet: Bool
    @Binding var tappedItem: DaysSinceItem
    var colored: Bool
    
    var body: some View {
        Section {
            ZStack(alignment: .leading) {
                if colored {
                    item.category.color
                } else {
                    Color.white
                }
                
                
                HStack {
//                    VStack(alignment:.leading) {
//                        Image(item.emoji)
//                            .font(.system(size:50, design: .rounded))

                    Text(item.name)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(colored ? .white : item.category.color)
//                    }
                    Spacer()
                    VStack {
                        Text("\(item.daysAgo)")
                            .font(.system(size:50, design: .rounded))
                            .bold()
                            .foregroundColor(colored ? .white : item.category.color)
                        Text("days")
                            .font(.system(.title2, design: .rounded))
                            .foregroundColor(colored ? .white : item.category.color)
                    }
                }
                .padding()
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(item.category.color, lineWidth: 5))
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .shadow(color: Color.black.opacity(0.05), radius: 20, x: 0, y: 0)
//                        .listRowBackground(item.category.color)
            .onTapGesture {
                    print("touched item \(item)")
                    editItemSheet = true
                    tappedItem = item

                }
        }
    }
}

//struct EventListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventListItemView(item: DaysSinceItem(name: "Placeholder", emoji: "Placeholder", dateLastDone: Date.now, getReminders: false, color: CategoryDaysSinceItem.work), editItemSheet: .constant(false), tappedItem: .constant(DaysSinceItem(name: "Placeholder", emoji: "Placeholder", dateLastDone: Date.now, color: CategoryDaysSinceItem.work)), colored: false)
//    }
//}
