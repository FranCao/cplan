module CoursesOfferingsHelper
    def translateTime(t)
        if t.nil?
            return ""
        else
            return t.strftime("%I:%M")
        end
    end
end
