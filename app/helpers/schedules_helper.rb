module SchedulesHelper
    def parseTime(t)
        return t.strftime("%H:%M") 
    end

    def parseTimePretty(t)
        return t.strftime("%I:%M%p") 
    end
end
