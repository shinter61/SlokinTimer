//
//  Records.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/07/01.
//

import SwiftUI

struct Records: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Record.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Record.startDate, ascending: false)]
    ) private var records: FetchedResults<Record>
    
    var body: some View {
        List {
            ForEach(records) { record in
                HStack {
                    Text("\(record.startDate!)")
                    Spacer()
                    Text("\(record.span!)")
                }
            }
        }
    }
}

struct Records_Previews: PreviewProvider {
    static var previews: some View {
        Records()
    }
}
