//
//  Province.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-11-21.
//

import Foundation

enum Province: String, CaseIterable, Identifiable{
    case AB, BC, MB, NB, NL, NS, ON, PEI, QC, SK, YT, NU, NT
    var id: Self { self }
}

