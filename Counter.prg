local(times[10])
local(total) = 0
local(average) = 0

local(x) = 10
local(y) = 10

testPerformance()
calculateAverage()
writeToFile()
windows()

method testPerformance()
{
    for (local(i) = 0; i < 10; i++)
    {
        local(startTime) = getTickCount()

        for (local(j) = 0; j <= 1000; j++)
        {
            // Do nothing.   
        }

        local(endTime) = getTickCount()

        local(timeTaken) = (endTime - startTime) / 1000
        times[i] = timeTaken
    }
}

method calculateAverage()
{
    for (local(i) = 0; i < 10; i++)
    {
        total += times[i]
    }
    
    average = total / 10
}

method writeToFile()
{
    openFileOutput("log.txt", "Misc\")

    for (local(i) = 0; i < 10; i++)
    {
        filePrint("log.txt", (i + 1) + ": " + times[i] + " seconds.") 
    }  
    
    filePrint("log.txt", "")
    filePrint("log.txt", "Average Time: " + average + " seconds.")
}
