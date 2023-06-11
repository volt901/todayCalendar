//
//  StartView.swift
//  todayCalendar
//
//  Created by Владимир Ширяев on 10.06.2023.
//

import SwiftUI

struct StartUIView: View {
   
    @State var flag = false
    @State var date = Date.now
    @State var textState: String = "Start {date} day"
    
    let nowDate = Date.now
    
    let dateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        return formatter
    }()
        
    var body: some View {
        ZStack{
            Color("BackColor")
            VStack(alignment: .leading){
                HStack{
                    Text(dateFormatter.string(from: nowDate))
                        .foregroundColor(Color(UIColor(red: 0.446, green:0.446, blue: 0.446, alpha: 1)))
                        .font(.system(size: 20))
                    Spacer()
                }
                .padding(.horizontal,37)
                .padding(.top,83)
                
                HStack{
                    Text("today")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 48))
                    
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    Spacer()
                    
                    Button{
                        flag.toggle()
                    }label:{
                        Text(dateFormatter.string(from:  date))
                            .foregroundColor(Color(UIColor(red:0, green: 0.663, blue: 0.026, alpha: 1)))
                            .font(.system(size: 48))
                            .bold()
                    }
                }
                .padding(.horizontal,37)
                
                Spacer()
                VStack(alignment: .leading){
                    Text(printWords(text: textState)[0]) + Text(printDay(data2:date, data1:nowDate)).foregroundColor(Color(UIColor(red:0, green: 0.663, blue: 0.026, alpha: 1))).underline().bold()+Text(printWords(text: textState)[1])
                }
                .foregroundColor(.white)
                .font(.system(size: 54))
                .padding(.horizontal,37)
                Spacer()
                Spacer()
            }
            .sheet(isPresented: $flag) {
                CalendarView(date: $date, textState: $textState)
                    .presentationDetents([.fraction(0.85)])
            }

        }.ignoresSafeArea()
    }
}

func printWords(text: String) -> [String] {
    //
    let greeting = text
    let indexТо = greeting.firstIndex(of: "{") ?? greeting.endIndex
    let beginningTo = greeting[..<indexТо]
    let indexAfter = greeting.index(after: greeting.lastIndex(of: "}") ?? greeting.endIndex)
    let beginningAfter = greeting[indexAfter..<greeting.endIndex]
    let newStringTo = String(beginningTo)
    let newStringAfter = String(beginningAfter)
    return [newStringTo, newStringAfter]
}

func printDay(data2: Date, data1: Date) -> String {
    let dateDiff = Calendar.current.dateComponents([.day], from: data1, to: data2).day
    return "\(Int(dateDiff!)+1)"
}


struct StartUIView_Previews: PreviewProvider {
    static var previews: some View {
        StartUIView()
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Int) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut

        if let result = formatter.string(from: value as NSNumber) {
            appendLiteral(result)
        }
    }
}

