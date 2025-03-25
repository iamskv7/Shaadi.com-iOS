import CoreData

class CoreDataManager: PersistenceServiceProtocol {
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Shaadi_com")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Unresolved error \(error)")
            }
        }
    }
    
    func addUser(_ user: User, status: String) {
        let fetchRequest = UserEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid == %@", user.login.uuid)
        
        do {
            if let existingUser = try context.fetch(fetchRequest).first {
                // Update existing user details but preserve status
                existingUser.firstName = user.name.first
                existingUser.lastName = user.name.last
                existingUser.city = user.location.city
                existingUser.country = user.location.country
                existingUser.imageURL = user.picture.large
                
                // Preserve status (do not overwrite)
            } else {
                // Add new user with default status "Pending"
                let newUser = UserEntity(context: context)
                newUser.uuid = user.login.uuid
                newUser.firstName = user.name.first
                newUser.lastName = user.name.last
                newUser.city = user.location.city
                newUser.country = user.location.country
                newUser.imageURL = user.picture.large
                newUser.status = "Pending"
            }
            
            saveContext()
        } catch {
            print("Failed to add or update user:", error)
        }
    }
    
    func updateUserStatus(uuid: String, status: String) {
        let fetchRequest = UserEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid == %@", uuid)
        
        do {
            if let userEntity = try context.fetch(fetchRequest).first {
                userEntity.status = status
                saveContext()
            }
        } catch {
            print("Failed to update user status:", error)
        }
    }
    
    func fetchUsers() -> [UserEntity] {
        do {
            return try context.fetch(UserEntity.fetchRequest())
        } catch {
            print("Failed to fetch users:", error)
            return []
        }
    }
}
