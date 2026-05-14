// =========================================
// SCENARIO 14 : Student Course Registration System
// MongoDB CRUD Operations using insertMany()
// =========================================


// =========================================
// 1. CREATE DATABASE
// =========================================
use CollegeDB


// =========================================
// 2. CREATE COLLECTION
// =========================================
db.createCollection("Students")


// =========================================
// 3. INSERT MULTIPLE DOCUMENTS
// =========================================
db.Students.insertMany([

{
    StudentID: 101,
    Name: "Amit",
    Course: "Computer Engineering",
    Year: 2,
    Marks: 85
},

{
    StudentID: 102,
    Name: "Priya",
    Course: "IT",
    Year: 3,
    Marks: 72
},

{
    StudentID: 103,
    Name: "Rahul",
    Course: "Computer Engineering",
    Year: 1,
    Marks: 90
},

{
    StudentID: 104,
    Name: "Anjali",
    Course: "Mechanical",
    Year: 4,
    Marks: 65
},

{
    StudentID: 105,
    Name: "Akash",
    Course: "IT",
    Year: 2,
    Marks: 58
}

])


// =========================================
// 4. READ OPERATIONS
// =========================================

// Display all students
db.Students.find()


// Students from Computer Engineering
db.Students.find({
    Course: "Computer Engineering"
})


// Students having marks greater than 70
db.Students.find({
    Marks: { $gt: 70 }
})


// =========================================
// 5. UPDATE OPERATION
// =========================================
db.Students.updateOne(
    { StudentID: 102 },
    { $set: { Course: "Computer Engineering" } }
)


// =========================================
// 6. DELETE OPERATION
// =========================================
db.Students.deleteOne({
    StudentID: 105
})


// =========================================
// 7. LOGICAL OPERATORS
// =========================================

// Marks > 60 AND Course = IT
db.Students.find({
    $and: [
        { Marks: { $gt: 60 } },
        { Course: "IT" }
    ]
})


// Course = Computer Engineering OR IT
db.Students.find({
    $or: [
        { Course: "Computer Engineering" },
        { Course: "IT" }
    ]
})