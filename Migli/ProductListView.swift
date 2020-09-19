//
//  ProductListView.swift
//  Migli
//
//  Created by Florian Thiévent on 19.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import SwiftUI

struct ProductListView: View {
    
    let products = Bundle.main.decode(Product.self, from: "products.json")
    
        var body: some View {
           Text("Banane")
        }
    }

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
