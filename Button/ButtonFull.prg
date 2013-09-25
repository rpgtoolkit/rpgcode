// Will need to be handled by some global object
// to save scattering calls to checkButton all
// over the place.
global(hoverX)
global(hoverY)
global(lastHoverY)
global(lastHoverX)
global(hoveredButton) = -2

global(lastClickX) = 0
global(lastClickY) = 0
global(clickX) = 0
global(clickY) = 0

// Specific to the Button implementation 
// will probably just use some horrible
// canvas by default.
global(buttonNormalImage) = "yes-button-normal.png"
global(buttonHoverImage) = "yes-button-hover.png"
global(buttonPressedImage) = "yes-button-pressed.png"

setButton(buttonNormalImage, 0, 10, 10, 75, 23)

// Basically the main event loop for any GUI
// system I guess.
while(true)
{
    checkForHover()
    checkForClick()   
}

// Specific to the global object/listener
// will need to keep a list of all the
// current buttons.
method checkForHover()
{
    // Will not working in 3.1
    mouseMove(hoverX, hoverY, true)
    
    local(result) = checkButton(hoverX, hoverY)
    
    if (result == hoveredButton)
    {
        // Inefficent repainting
        buttonHovered(hoveredButton)
    }
    elseif (result == -1)
    {
        if (hoveredButton ~= -2)
        {
            normalizeButton(hoveredButton)
            hoveredButton = -2
        }
    }
    else
    {
        if (hoveredButton ~= -2)
        {
            normalizeButton(hoveredButton) 
            hoveredButton = -2   
        }
        
        if (result > -1)
        {
            hoveredButton = result
            buttonHovered(hoveredButton)   
        }
    }
}

// Specific to the global object/listener
// will need to keep a list of all the
// current buttons.
method checkForClick()
{
    mouseClick(clickX, clickY, true)
    
    if (clickX ~= lastClickX || clickY ~= lastClickY)
    {
        lastClickX = clickX
        lastClickY = clickY   
        
        local(clickedButton)
        clickedButton = checkButton(clickX, clickY)
       
        buttonClicked(clickedButton)
    }
}

// Specific to the global object/listener
// will tell button object to clear itself
// and paint as hovered
method buttonHovered(buttonNumber)
{
    switch(buttonNumber)
    {
      case 0:
        {
            clearButtons(0)
            setButton(buttonHoverImage, 0, 10, 10, 75, 23)
        }
    }
}

// Specific to the global object/listener
// will tell button object to clear itself
// and paint as clicked
method buttonClicked(buttonNumber)
{
    switch(buttonNumber)
    {
      case 0:
        {
            clearButtons(0)
            setButton(buttonPressedImage, 0, 10, 10, 75, 23)
            delay(0.2)
            //mwin("You clicked an RPGCode button!")
            //wait()
            //mwinCls()
        }
    }
}

// Specific to the global object/listener
// will tell button object to clear itself
// and paint as normal
method normalizeButton(buttonNumber)
{
    switch(buttonNumber)
    {
      case 0:
        {
            clearButtons(0)
            setButton(buttonNormalImage, 0, 10, 10, 75, 23)
        }
    }
}