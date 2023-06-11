//
//  CalendarView.swift
//  todayCalendar
//
//  Created by Владимир Ширяев on 10.06.2023.
//

import SwiftUI

struct CalendarView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var date: Date
    @Binding var textState: String
    
    var body: some View {
        ZStack{
            Color(.black)
            VStack {
                DatePicker("", selection: $date,displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .background(Color(UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)))
                    .colorScheme(.dark)
                    .accentColor(Color(UIColor(red: 1, green: 0.271, blue: 0.227, alpha: 1)))
                    .cornerRadius(13)
                
                VStack {
                    TextField("", text: $textState)
                        .font(.system(size: 24))
                        .padding(.vertical,31)
                        .padding(.horizontal,23)
                        .background(Color(UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)))
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .bold()
                }
                .padding(.top,26)
                
                Button {
                    dismiss()
                    
                } label: {
                    Text("set")
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 24))
                        .background(Color(UIColor(red: 0, green: 0.663, blue: 0.026, alpha: 1)))
                        .cornerRadius(20)
                        .foregroundColor(.white)
                }
                .padding(.top,38)
            }
            .padding(.horizontal,15)
        }
        .ignoresSafeArea()
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
