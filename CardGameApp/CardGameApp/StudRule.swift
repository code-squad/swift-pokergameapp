class StudRule {
    let requiredCards: Int
    
    init(requiredCards: Int) {
        self.requiredCards = requiredCards
    }
}

class FiveStudRule: StudRule {
    init() {
        super.init(requiredCards: 5)
    }
}

class SevenStudRule: StudRule {
    init() {
        super.init(requiredCards: 7)
    }
}

