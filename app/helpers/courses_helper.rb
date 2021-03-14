module CoursesHelper
    # def translateDay(course)
    #     if course.day.nil?
    #         return ""
    #     else
    #         weekday = ["Sun ", "Sat ", "Fri ", "Thu ", "Wed ", "Tue ", "Mon "]
    #         i = 6
    #         result = ""
    #         while i >= 0 do
    #             minus = 2 ** i
    #             if course.day / minus > 0 then
    #                 result += weekday[i]
    #                 course.day -= minus
    #             end
    #             i -= 1
    #         end
    #         return result[0...-1]
    #     end
    # end

    # def translateTime(t)
    #     if t.nil?
    #         return ""
    #     else
    #         return t.strftime("%I:%M %p")
    #     end
    # end
end
