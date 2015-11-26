

#Build an array with time object in 60 sec increment upto 10
i = 0
t = 0
time_spread = []
while i < 10 do t
t =   t + 60
time = Time.now + t
i+=1
time_spread.push(time.strftime("%H:%M"))
end



puts time_spread