#include "rpgcode\slide\Button.prg"

// Imported simply for autocomplete items.
#include "rpgcode\slide\AbstractButton.prg"
#include "rpgcode\slide\Component.prg" 

global(hoverX)
global(hoverY)
global(lastHoverY)
global(lastHoverX)
global(hoveredButton) = -2

global(lastClickX) = 0
global(lastClickY) = 0
global(clickX) = 0
global(clickY) = 0

// View
global(jbutton) = Button("Hello World", "")
jbutton->setSize(100, 26)
jbutton->setName("MyButton")
jbutton->setLocation(100, 100)
jbutton->setBackgroundColour(100, 100, 100)
jbutton->setForegroundColour(255, 255, 255)
jbutton->setSlotNumber(0)
jbutton->paint()

// Basically the main event loop for any GUI
// system I guess.
while(true)
{
    checkForHover()
    checkForClick()  
}

method checkForHover()
{
    mouseMove(hoverX, hoverY, true)
    
    local(result) = checkButton(hoverX, hoverY)
    
    //debugger("checkButton result: " + result)
    
    if (result == hoveredButton)
    {
        // Inefficent repainting
        jbutton->setRolledOver(true)
    }
    elseif (result == -1)
    {
        if (hoveredButton ~= -2)
        {
            jbutton->setRolledOver(false)
            hoveredButton = -2
        }
    }
    else
    {
        if (hoveredButton ~= -2)
        {
            jbutton->setRolledOver(false) 
            hoveredButton = -2   
        }
        
        if (result > -1)
        {
            hoveredButton = result
            jbutton->setRolledOver(true)   
        }
    }
    
    jbutton->paint()
}

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

method buttonClicked(buttonNumber)
{
    switch(buttonNumber)
    {
      case 0:
        {
            jbutton->setPressed(true)
        }
    }
    
    jbutton->paint()
    delay(0.25)
    jbutton->setPressed(false)
}