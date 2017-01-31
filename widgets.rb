require 'csv'

class Employee

  # Employee's attributes 
  attr_accessor :state, :plant, :dept, :empid, :name, :count
  def initialize(opts = {})
      
    @state = opts[:state]
    @plant = opts[:plant]
    @dept = opts[:dept]
    @empid = opts[:empid]
    @name = opts[:name]
    @count = opts[:count]
    
  end
  def to_s
      "%8s %8s %8s %8s %8s %-20s" % [state, plant, dept, empid, count, name]
  end

end

# define an array to hold the employee records
employee = Array.new

# open the csv file
f = File.open("widgets.csv", "r")

# loop through each record in the csv file, adding
# each record to our array.
f.each_line { |line|

  # split each lines by commas save into fields
  fields = line.split(',')
  
  # create a new Employee
  e = Employee.new

  # save read in line input as employee info
  e.state = fields[0].to_s.chomp
  e.plant = fields[1].to_s.chomp
  e.dept = fields[2].to_s.chomp
  e.empid = fields[3].to_s.chomp
  e.name = fields[4].to_s.chomp
  e.count = fields[5].to_s.chomp

  employee.push(e)
}


File.open("widgets.out", "w") do |file|
    
    #find header and sent to file
    file.puts employee.find_all{|i| i.state == "STATE"}
    file.puts
    
    #find all employees under department #56 at plant #34 in state #12
    file.puts employee.find_all{|i| i.state == "12" && i.dept == "56" && i.plant == "34"}

    #calculate number of widgets made from department #56 at plant #34 in state #12
    results = {} 
    grand_total = 0
    employee.each do |widget|
        if widget.state == "12" && widget.plant == "34" && widget.dept == "56"
            results[widget.dept] ||= 0
            results[widget.dept] += widget.count.to_i
        end
    end

    #enter department 56 total in file
    results.each do |key, value|
        file.puts
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR DEPT 56' ]
        file.puts
        results = {}
    end

    #find all employees under departmen #57 at plant #34 in state #12
    file.puts employee.find_all{|i| i.state == "12" && i.dept == "57" && i.plant == "34"}
    
    #calculate number of widgets made from department #57 at plant #34 in state #12
    results = {} 
    employee.each do |widget|
        if widget.state == "12" && widget.plant == "34" && widget.dept == "57"
            results[widget.dept] ||= 0
            results[widget.dept] += widget.count.to_i
        end
    end

    #enter department 57 total in file
    results.each do |key, value|
        file.puts
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR DEPT 57' ]
        results = {}
    end
    
    #find total number of widgets made at plant #34
    employee.each do |widget|
        if widget.plant == "34"
            results[widget.plant] ||= 0
            results[widget.plant] += widget.count.to_i
            grand_total += widget.count.to_i
        end
    end

    #enter plant #34 total in file
    results.each do |key, value|
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR PLANT 34' ]
        file.puts
        
        results = {}
    end
    
     #find all employees under department #57 at plant #40 in state #12
    file.puts employee.find_all{|i| i.state == "12" && i.dept == "57" && i.plant == "40"}

    #calculate number of widgets made from department #56 at plant #34 in state #12
    employee.each do |widget|
        if widget.state == "12" && widget.plant == "40" && widget.dept == "57"
            results[widget.dept] ||= 0
            results[widget.dept] += widget.count.to_i
        end
    end

    #enter department 57 total in file
    results.each do |key, value|
        file.puts
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR DEPT 57' ]
        file.puts
        results = {}
    end
    
    #find all employees under department #75 at plant #40 in state #12
    file.puts employee.find_all{|i| i.state == "12" && i.dept == "75" && i.plant == "40"}

    #calculate number of widgets made from department #56 at plant #34 in state #12
    employee.each do |widget|
        if widget.state == "12" && widget.plant == "40" && widget.dept == "75"
            results[widget.dept] ||= 0
            results[widget.dept] += widget.count.to_i
        end
    end

    #enter department 75 total in file
    results.each do |key, value|
        file.puts
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR DEPT 75' ]
        results = {}
    end
    
    #find total number of widgets made at plant #40
    employee.each do |widget|
        if widget.plant == "40"
            results[widget.plant] ||= 0
            results[widget.plant] += widget.count.to_i
            grand_total += widget.count.to_i
        end
    end

    #enter plant #40 total in file
    results.each do |key, value|
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR PLANT 40' ]
        results = {}
    end
    
    #find total number of widgets made in state #12
    employee.each do |widget|
        if widget.state == "12"
            results[widget.state] ||= 0
            results[widget.state] += widget.count.to_i
        end
    end

    #enter state #12 total in file
    results.each do |key, value|
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR STATE 12' ]
        file.puts
        results = {}
    end
    
    #find all employees under department #11 at plant #22 in state #33
    file.puts employee.find_all{|i| i.state == "33" && i.dept == "11" && i.plant == "22"}

    #calculate number of widgets made from department #11 at plant #22 in state #33
    employee.each do |widget|
        if widget.state == "33" && widget.plant == "22" && widget.dept == "11"
            results[widget.dept] ||= 0
            results[widget.dept] += widget.count.to_i
        end
    end

    #enter department 11 total in file
    results.each do |key, value|
        file.puts
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR DEPT 11' ]
        file.puts
        results = {}
    end
    
    #find all employees under department #14 at plant #22 in state #33
    file.puts employee.find_all{|i| i.state == "33" && i.dept == "14" && i.plant == "22"}
    file.puts

    #calculate number of widgets made from department #14 at plant #22 in state #33
    employee.each do |widget|
        if widget.state == "33" && widget.plant == "22" && widget.dept == "14"
            results[widget.dept] ||= 0
            results[widget.dept] += widget.count.to_i
        end
    end

    #enter department 14 total in file
    results.each do |key, value|
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR DEPT 14' ]
        results = {}
    end
    
    #find total number of widgets made at plant #22
    employee.each do |widget|
        if widget.plant == "22"
            results[widget.plant] ||= 0
            results[widget.plant] += widget.count.to_i
            grand_total += widget.count.to_i
        end
    end

    #enter plant #22 total in file
    results.each do |key, value|
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR PLANT 22' ]
        file.puts
        results = {}
    end
    
    #find all employees under department #19 at plant #27 in state #33
    file.puts employee.find_all{|i| i.state == "33" && i.dept == "19" && i.plant == "27"}

    #calculate number of widgets made from department #19 at plant #27 in state #33
    employee.each do |widget|
        if widget.state == "33" && widget.plant == "27" && widget.dept == "19"
            results[widget.dept] ||= 0
            results[widget.dept] += widget.count.to_i
        end
    end

    #enter department 19 total in file
    results.each do |key, value|
        file.puts
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR DEPT 19' ]
        results = {}
    end
    
    #find total number of widgets made at plant #27
    employee.each do |widget|
        if widget.plant == "27"
            results[widget.plant] ||= 0
            results[widget.plant] += widget.count.to_i
            grand_total += widget.count.to_i
        end
    end

    #enter plant #27 total in file
    results.each do |key, value|
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR PLANT 27' ]
        results = {}
    end
    
    #find total number of widgets made in state #33
    employee.each do |widget|
        if widget.state == "33"
            results[widget.state] ||= 0
            results[widget.state] += widget.count.to_i
        end
    end

    #enter state #33 total in file
    results.each do |key, value|
        file.puts "%44s %-20s" % [ "#{value}", 'TOTAL FOR STATE 33' ]
        results = {}
    end
    
    #enter grand total in file
    file.puts "%44s %-20s" % [ "#{grand_total}", 'GRAND TOTAL' ]
end