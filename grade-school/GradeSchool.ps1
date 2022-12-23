<#
.SYNOPSIS
    Given students' names along with the grade that they are in,
    create a roster for the school.
.DESCRIPTION
    In the end, you should be able to:

    Add a student's name to the roster for a grade
    "Add Jim to grade 2."
    "OK."
    Get a list of all students enrolled in a grade
    "Which students are in grade 2?"
    "We've only got Jim just now."
    Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., and students within a grade should be sorted alphabetically by name.
    "Who all is enrolled in school right now?"
    "Grade 1: Anna, Barb, and Charlie. Grade 2: Alex, Peter, and Zoe. Grade 3…"
    Note that all our students only have one name. (It's a small town, what do you want?)
.EXAMPLE
    PS C:\> $roster = [Roster]::new()
            $roster.AddStudent(1,'Billy')
            $roster.AddStudent(1,'Josh')
            $roster.AddStudent(2,'Allison')
            $roster.GetRoster()
            $roster.GetRoster(2)

            This will create a new roster and add 3 students to it.
            When no arguments are supplied to the GetRoster method, all students will be returned.
            When a grade number is supplied to the GetRoster method, students from that grade will be returned.
#>

class Student {
    [string]$Name
    [int]$Grade
    Student([int]$gr, [string]$na) {
        # write-host "Creating student $na in grade $gr"
        $this.Name = $na
        $this.Grade = $gr
    }
}

class Roster {
    [Student]$Student
    [Student[]]$Students

    Roster() {
        # Write-Host "Constructing Roster"
        $this.Students = @()
    }

    [void] AddStudent([int]$Grade, [string]$Name) {
        $this.Student = [Student]::new($Grade,$Name)
        $this.Students += $this.Student
    }
    
    [Student[]] GetRoster([int]$grade) {
        # Write-Host "Hoping to deliver names for Grade $grade"
        $gradeStudents = $this.Students
            | Where-Object -Property Grade -eq $grade
            | Sort-Object -Property Name
        return $gradeStudents
    }
    
    [Student[]] GetRoster() {
        # Write-Host "Hoping to deliver names for all grades"
        $res = @()
        # $grades =  $this.Students 
        #   | Sort-Object -Property Grade 
        #   | Select-Object -Property Grade -Unique
        $grades =  $this.Students.Grade | Sort-Object -unique
        foreach ($grade in $grades) {
            $res += $this.GetRoster($grade)
        }
        return $res
    }
        
    [int[]] GetGrades() {
        $grades =  $this.Students.Grade | Sort-Object -unique
        return $grades
    }
}