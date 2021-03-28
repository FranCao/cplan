module SchedulesHelper
    def parseTime(t)
        return t.strftime("%I:%M %p") 
    end
end
