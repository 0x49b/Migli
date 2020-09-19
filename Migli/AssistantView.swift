//
//  AssistantView.swift
//  Migli
//
//  Created by Roger Kreienbuehl on 19.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import SwiftUI

struct AssistantView: View {
    @Binding var showAssistantView: Bool

    var body: some View {
        NavigationView {
            Text("Migli assistant")
            .navigationBarTitle(Text("Migli assistant"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showAssistantView = false
                }) {
                    Text("Done").bold()
                })
        }
    }
}
