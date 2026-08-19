class Event {
    var eventName: String
    var location: String
    var date: String
    var organizer: String
    init(eventName: String, location: String, date: String, organizer: String) {
        self.eventName = eventName
        self.location = location
        self.date = date
        self.organizer = organizer
    }
    func scheduleEvent() {
        print("\(eventName) is scheduled on \(date)")
    }
    func rescheduleEvent(date: String) {
        self.date = date
        print("\(eventName) is rescheduled on \(date)")
    }
    func displayInfo() {
        print("Event Name: \(eventName)")
        print("Location: \(location)")
        print("Date: \(date)")
        print("Organizer: \(organizer)")
    }
}
class Satsang: Event {
    var speakerName: String
    var bhajanList: [String]
    var duration: Int
    init(eventName: String, location: String, date: String, organizer: String, speakerName: String, bhajanList: [String], duration: Int){
        self.speakerName = speakerName
        self.bhajanList = bhajanList
        self.duration = duration
        super.init(eventName: eventName, location: location, date: date, organizer: organizer)
    }
    func addBhajan(bhajanName: String) {
        bhajanList.append(bhajanName)
    }
    func displayBhajans(date: String) {
        print("Bhajans for \(date): \(bhajanList.joined(separator: ", "))")
    }
    override func displayInfo() {
        super.displayInfo()
        print("Speaker Name: \(speakerName)")
        print("Bhajan List: \(bhajanList.joined(separator: ", "))")
        print("Duration: \(duration)")
    }
}

class Concert: Event {
    var performer: String
    var genre: String
    var ticketPrice: Double
    var seatsAvailable: Int
    init(eventName: String, location: String, date: String, organizer: String, performer: String, genre: String, ticketPrice: Double, seatsAvailable: Int) {
        self.performer = performer
        self.genre = genre
        self.ticketPrice = ticketPrice
        self.seatsAvailable = seatsAvailable
        super.init(eventName: eventName, location: location, date: date, organizer: organizer)
    }
    func bookTicket(count: Int) {
        if seatsAvailable >= count {
            seatsAvailable -= count
            print("Successfully booked \(count) ticket(s).")
        } else {
            print("Booking failed! Not enough seats available.")
        }
    }
    func isSoldout() {
        if seatsAvailable == 0 {
            print("Concert is sold out!")
        } else {
            print("Seats are available!")
        }
    }
    override func displayInfo() {
        super.displayInfo()
        print("Performer: \(performer)")
        print("Genre: \(genre)")
        print("Ticket Price: \(ticketPrice)")
        print("Seats Available: \(seatsAvailable)")
    }
}
class MeditationSession: Satsang {
    override init(eventName: String, location: String, date: String, organizer: String, speakerName: String, bhajanList: [String], duration: Int) {
            super.init(eventName: eventName, location: location, date: date, organizer: organizer, speakerName: speakerName, bhajanList: bhajanList, duration: duration)
        }
}
class RockConcert: Concert {
    override init(eventName: String, location: String, date: String, organizer: String, performer: String, genre: String, ticketPrice: Double, seatsAvailable: Int) {
            super.init(eventName: eventName, location: location, date: date, organizer: organizer, performer: performer, genre: genre, ticketPrice: ticketPrice, seatsAvailable: seatsAvailable)
        }
}

let morningMeditation = MeditationSession(eventName: "Sunrise Inner Peace Retreat", location: "Pune Osho Ashram", date: "15-Aug-2026", organizer: "Pune Wellness Society", speakerName: "Swami Anand", bhajanList: ["Om Chanting", "Shanti Mantra"], duration: 90)
print()
morningMeditation.scheduleEvent()
print()
morningMeditation.rescheduleEvent(date: "17-Aug-2026")
print()
morningMeditation.addBhajan(bhajanName: "Gayatri Mantra")
morningMeditation.displayBhajans(date: "17-Aug-2026")
print()
morningMeditation.displayInfo()
print()

print("----------------")
let summerRockFest = RockConcert(eventName: "Monsoon Rock Arena", location: "NH7 Weekender Grounds", date: "20-Aug-2026", organizer: "Live Nation", performer: "The Local Train", genre: "Indie Rock", ticketPrice: 1500.00, seatsAvailable: 5000)
print()
summerRockFest.scheduleEvent()
print()
summerRockFest.rescheduleEvent(date: "22-Aug-2026" )
print()
summerRockFest.bookTicket(count: 5000)
print()
summerRockFest.isSoldout()
print()
summerRockFest.displayInfo()
print()
