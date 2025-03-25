//
//  UserViewModel.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    private let networkService: NetworkServiceProtocol
    private let persistenceService: PersistenceServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkManager.shared,
         persistenceService: PersistenceServiceProtocol = CoreDataManager.shared) {
        self.networkService = networkService
        self.persistenceService = persistenceService
    }
    
    func fetchUsers() {
        networkService.fetchUsers { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedUsers):
                    fetchedUsers.forEach { [weak self] user in
                        guard let self else { return }
                        self.persistenceService.addUser(user, status: "Pending") // Update individual rows in Core Data
                    }
                    self.loadCachedUsers()
                case .failure(let error):
                    print("Failed to fetch users:", error)
                    self.loadCachedUsers()
                }
            }
        }
    }
    
    private func updateUI(user: User, status: String) {
        if let index = users.firstIndex(where: { $0.login.uuid == user.login.uuid }) {
            users[index].status = status // Update local array to trigger UI refresh
        }
    }
    
    func acceptUser(_ user: User) {
        persistenceService.updateUserStatus(uuid: user.login.uuid, status: "Accepted")
        loadCachedUsers()
    }
    
    func declineUser(_ user: User) {
        persistenceService.updateUserStatus(uuid: user.login.uuid, status: "Declined")
        loadCachedUsers()
    }
    
    private func loadCachedUsers() {
        let cachedEntities = persistenceService.fetchUsers()
        self.users = cachedEntities.map { entity in
            User(
                gender: "",
                name: User.Name(title: "", first: entity.firstName ?? "", last: entity.lastName ?? ""),
                location: User.Location(city: entity.city ?? "", state: "", country: entity.country ?? ""),
                email: "",
                dob: User.DOB(date: "", age: 0),
                phone: "",
                cell: "",
                picture: User.Picture(large: entity.imageURL ?? "", medium: "", thumbnail: ""),
                login: User.Login(uuid: entity.uuid ?? ""),
                status: entity.status ?? "Pending"
            )
        }
    }
}
