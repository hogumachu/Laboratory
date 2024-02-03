//
//  AddContactFeature.swift
//  TCATutorial
//
//  Created by 홍성준 on 2/3/24.
//

import ComposableArchitecture

@Reducer
struct AddContactFeature {
  
  @ObservableState
  struct State: Equatable {
    var contact: Contact
    
    init(contact: Contact) {
      self.contact = contact
    }
  }
  
  enum Action {
    case cancelButtonTapped
    case delegate(Delegate)
    case saveButtonTapped
    case setName(String)
    
    enum Delegate {
      case save(Contact)
    }
  }
  
  @Dependency(\.dismiss) var dismiss
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .cancelButtonTapped:
        return .run { _ in await dismiss() }
        
      case .delegate:
        return .none
        
      case .saveButtonTapped:
        return .run { [contact = state.contact] send in
          await send(.delegate(.save(contact)))
          await dismiss()
        }
        
      case let .setName(name):
        state.contact.name = name
        return .none
      }
    }
  }
}
