//
//  ContentView.swift
//  ADNCeiba
//
//  Created by Matt Leon on 2/12/20.
//

import SwiftUI

struct EnterVehicleView: View {
    
   
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 10){
                Text("Registrar Ingreso de vehiculo")
                    .font(.headline).lineLimit(nil)
                    
                Button(action: {
                    // Code Goes Here
                }) {
                    Image(systemName: "car")
                        .resizable()
                        .frame(width: 128.0, height: 100.0)
                        .foregroundColor(.black)
                }
                .padding(.vertical)
                .padding(.horizontal, 80)
                .background(Color(.systemFill))
                .cornerRadius(15)
                
                Button(action: {
                    // Code Goes Here
                }) {
                    Image("moto")
                        .resizable()
                        .frame(width: 128.0, height: 100)
                        
                }
                .padding(.vertical)
                .padding(.horizontal, 80)
                .background(Color(.systemFill))
                .cornerRadius(15)
            }
        }.navigationBarTitle("Estacionamiento")
        
        LandscapeView()
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EnterVehicleView()
    }
}
