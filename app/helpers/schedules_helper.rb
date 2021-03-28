module SchedulesHelper
    def parseTime(t)
        if t.nil?
            return ""
        else
            return t.strftime("%H:%M")
        end
    end

    def parseTimePretty(t)
        if t.nil?
            return ""
        else
            return t.strftime("%I:%M%p")
        end
    end
end
