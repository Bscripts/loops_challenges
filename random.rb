x = 10
nums = []

x.times do |i|
    r = rand(0..100)
    nums.push(r)
end

sorted = nums.sort
# print sorted, "\n"

def median(list)
    answer = 0
    halflist = list.size / 2
    otherhalf = halflist - 1
    if list.size % 2 == 0
        answer = (list[halflist] + list[otherhalf]) / 2
    else
        answer = list[halflist]
    end
    return answer
end

# test = [6,8,14,56,78,32,78,12,78]

# puts median(sorted) 

def mode(list)
    mode = 0
    biggesttime = 1
    list.size.times do |i|
        times = 0
        list.size.times do |n|
            if list[i] == list[n]
                times = times + 1
            end
            if times > biggesttime
                biggesttime = times
                mode = list[i]
            end
        end
    end
    if biggesttime <= 1
        return list
    else 
        return mode
    end
end

# puts mode(sorted)

def standardev(list)
    basictotal = 0
    list.size.times do |i|
        basictotal = basictotal + i
    end 
    mean = basictotal / list.size
    newtotal = 0
    list.size.times do |n|
        newtotal = (n - mean) * (n - mean) + newtotal
    end
    newmean = newtotal / list.size
    standarddeviation = Math.sqrt(newmean)
    return standarddeviation
end

# puts standardev(sorted)

# threed == 3 appears 3 times in the array but not next to one another

def threed(list)
    hasthree = 0
    inarow = 0
    list.size.times do |i|
        if list[i] == 3
            hasthree += 1
        end
        if list[i] == 3 && list[i+1] == 3 && i != (list.size - 1)
            inarow += 1
        end
    end
    if hasthree == 3 && inarow == 0
        return true
    else
        return false
    end
end

# puts threed([3,3,6,8,6,3])
# puts threed([3,4,3,6,8,6,3])
# puts threed([7,6,3,6,7,3])

def same_first_last(list)
    if list[0] == list[list.size - 1] && list.size != 1
        return true
    else 
        return false
    end
end

# puts same_first_last([3,3,6,8,6,3])
# puts same_first_last([3,4,3,6,8,6,7])
# puts same_first_last([8,6,3,6,7,8])

def get_sandwich(str)
    firstbread = false
    secondbread = false
    fillingsstart = 0
    fillingsend = 0
    str.size.times do |i|
        if firstbread == false
            split = str[i..(i + 4)]
            if split == "bread"
                firstbread = true
                fillingsstart = (i + 5)
            end
        end
        if firstbread == true && secondbread == false
            split2 = str[i..(i + 4)]
            if split2 == "bread"
                secondbread = false
                fillingsend = (i - 1)
            end
        end
    end
    return str[fillingsstart..fillingsend]
end

# puts get_sandwich("jfgkbreadvegimitebread")

def shift_left(list)
    firstnum = 0
    list.size.times do |n|
        if n == 0
            firstnum = list[0]
        end
        if n == (list.size - 1)
            list[list.size - 1] = firstnum
        else
            list[n] = list[n + 1]
        end
    end
    return list
end

# print shift_left([3,3,6,8,6,3])
# print "\n"
# print shift_left([3,4,3,6,8,6,7])
# print "\n"
# print shift_left([8,6,3,6,7,8])
# print "\n"

def can_balance(list)
    firstpart = 0
    secondpart = 0
    list.size.times do |n|
        firstpart = 0
        secondpart = 0
        if n != 0 && n != (list.size - 1)
            list.size.times do |i|
                if i <= n
                    firstpart = firstpart + list[i]
                end
                if i > n
                    secondpart = secondpart + list[i]
                end
            end
            if firstpart == secondpart
                return true
            end
        end
        if n == 0
            list.size.times do |i|
                if i != 0
                secondpart = secondpart + list[i]
                end
            end
            if list[0] == secondpart
                return true
            end
        end
        if n == (list.size - 1)
            list.size.times do |i|
                if i != (list.size - 1)
                firstpart = firstpart + list[i]
                end
            end
            if list[(list.size - 1)] == firstpart
                return true
            end
        end
    end
    return false
end

# puts can_balance([7,2,3,2])
# puts can_balance([2,2,3,7])
# puts can_balance([4,2,3,3])
# puts can_balance([9,2,3,2])

# count code - anywhere co_e occures add 1 to a counter

def count_code(str)
    times = 0
    str.size.times do |n|
        if n != (str.size - 1) && n != (str.size - 2) && n != (str.size - 3) && str[n] == "c" && str[n + 1] == "o" && str[n + 3] == "e"
            times += 1
        end
    end
    return times
end

# puts count_code("dghdoihcofevbbcogebvufbcode")

# middle_way - take median of two lists and put them in a new list

def middle_way(list1,list2)
    final_list = [0,0]
    answer1 = 0
    answer2 = 0
    halflist1 = list1.size / 2
    otherhalf1 = halflist1 - 1
    if list1.size % 2 == 0
        answer1 = (list1[halflist1] + list1[otherhalf1]) / 2
    else
        answer1 = list1[halflist1]
    end
    halflist2 = list2.size / 2
    otherhalf2 = halflist2 - 1
    if list2.size % 2 == 0
        answer2 = (list2[halflist2] + list2[otherhalf2]) / 2
    else
        answer2 = list2[halflist2]
    end
    final_list = [answer1,answer2]
    return final_list
end

# print middle_way([1,4,7],[3,5,3,7])

# either_2_4 - return true if there is either a 2 next to a 2 or a 4 next to a 4 but not both

def either_2_4(list)
    twos = false
    fours = false
    list.size.times do |n|
        if list[n] == 4 && list[n+1] == 4
            fours = true
        end
        if list[n] == 2 && list[n+1] == 2
            twos = true
        end
    end
    if twos == true && fours == true
        return false
    end
    if twos == false && fours == false
        return false
    end
    return true
end

# puts either_2_4([2,4,6,3,5,2,2,5,8])
# puts either_2_4([2,4,4,3,5,9,2,5,8])
# puts either_2_4([2,4,6,3,5,9,2,5,8])

# max_span largest span between two numbers in a list

def max_span(list)
    span = 0
    maxspan = 0
    unspan = 0
    list.size.times do |n|
        list.size.times do |i|
            if i != n && list[i] == list[n]
                unspan = (n - i)
                span = unspan.abs
            end
            if span > maxspan
                maxspan = span
            end
        end
    end
    return maxspan
end

# puts max_span([1,3,5,1,6,4])
# puts max_span([19,3,5,3,6,4])
# puts max_span([0,3,5,1,1,4])

# g happy- all g's must have g's next to them

def g_happy(str)
    happy = true
    str.size.times do |n|
        if str[n] == "g" && str[n + 1] != "g" && str[n - 1] != "g"
            happy = false
        end
    end
    return happy
end

# puts g_happy("hjdggbjdbvjgghg")
# puts g_happy("hjdggbjdbvjggh")

# merge put two lists together in order

def merge(list1,list2)
    mixed = []
    list1.size.times do |n|
        mixed.push(list1[n])
    end
    list2.size.times do |n|
        mixed.push(list2[n])
    end
return mixed.sort
end

print merge([5,3,6,3,9],[6,3,7,3,9])
print "\n"
print merge([5,854,878,3,9,743],[6,364,3677,3,4539,76543,64])
