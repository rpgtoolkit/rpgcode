drawCanvasImmediately()
drawCanvasProgressive()
wait()

method drawCanvasImmediately()
{
    local(width) = 640
    local(height) = 480
    colorRGB(255, 255, 255)
    local(canvas) = createCanvas(width, height)
 
    fillRect(0, 0, width, height, canvas)
    drawCanvas(canvas, 0, 0, width, height)
  
    wait()
    clear(canvas)
    killCanvas(canvas) 
    forceReDraw() 
}

// Run this in a thread and it is very slow...
method drawCanvasProgressive()
{
    local(width) = 1
    local(height) = 1
    colorRGB(255, 255, 255)

    while(width <= 640 && height <= 480)
    {
       local(canvas) = createCanvas(width, height)

       fillRect(0, 0, width, height, canvas)
       drawCanvas(canvas, 0, 0)
       
       width += 0.4
       height += 0.3
       
       killCanvas(canvas)
    }    
}
