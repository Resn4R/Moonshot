//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Vito Borghi on 12/09/2023.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct Custom_Divider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
