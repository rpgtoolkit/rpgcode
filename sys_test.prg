#include "rpgcode\slide\Button.prg"
#include "rpgcode\slide\Label.prg"
#include "rpgcode\util\ArrayList.prg"

// Imported simply for autocomplete items.
#include "rpgcode\slide\AbstractButton.prg"
#include "rpgcode\slide\Component.prg" 

// Globals
global(hoverX)
global(hoverY)
global(lastHoverY)
global(lastHoverX)
global(hoveredButton) = -2

global(lastClickX) = 0
global(lastClickY) = 0
global(clickX) = 0
global(clickY) = 0

global(buttons) = ArrayList()

createLabels()
createButtons()

// Main Event Loop.
while(true)
{
    checkForHover()
    checkForClick()  
}

method createLabels()
{
    local(myLabel) = Label("Exit to Windows?")
    myLabel->setName("myLabel")
    myLabel->setX(250)
    myLabel->setY(185)
    myLabel->setBackgroundColour(100, 100, 100)
    myLabel->setForegroundColour(255, 255, 255)
    myLabel->paint()
}

method createButtons()
{
     // View
     local(button1) = Button("No", "")
     button1->setName("button1")
     button1->setLocation(270, 210)
     button1->setBackgroundColour(100, 100, 100)
     button1->setForegroundColour(255, 255, 255)
     button1->setSlotNumber(1)
     button1->paint()
     
     // View
     local(button2) = Button("Yes", "")
     button2->setName("button2")
     button2->setLocation(320, 210)
     button2->setBackgroundColour(100, 100, 100)
     button2->setForegroundColour(255, 255, 255)
     button2->setSlotNumber(2)
     button2->paint()

     buttons->addElement(button1)  
     buttons->addElement(button2)
}

method checkForHover()
{
    mouseMove(hoverX, hoverY, true)
    
    local(result) = checkButton(hoverX, hoverY)
    local(button) = null
    
    // Hovering over the same button.
    if (result == hoveredButton)
    {
        button = findButtonWithId(hoveredButton)
        
        if (button ~= null)
        {
            button->setRolledOver(true)
        }
    }
    elseif (result == -1) // Not hovering over a button.
    {
        // If we previously hovered over a button
        // then reset it.
        if (hoveredButton ~= -2)
        {
            button = findButtonWithId(hoveredButton)
        
            if (button ~= null)
            {
                button->setRolledOver(false)
            }

            hoveredButton = -2
        }
    }
    else // We hovered over a new button.
    {
        // Reset the previously hovered button, if any.
        if (hoveredButton ~= -2)
        {
            button = findButtonWithId(hoveredButton)
        
            if (button ~= null)
            {
                button->setRolledOver(false)
            }
  
            hoveredButton = -2   
        }
        
        // Set the button that we hovered over.
        if (result > -1)
        {
            hoveredButton = result
            
            button = findButtonWithId(hoveredButton)
        
            if (button ~= null)
            {
                button->setRolledOver(true)
            } 
        }
    }
    
    if (button ~= null)
    {
        button->paint()   
    }
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
       
        if (clickedButton > -1)
        {
            buttonClicked(clickedButton)
        }
    }
}

method buttonClicked(buttonNumber)
{    
    for (local(i) = 0; i < buttons->size(); i++)
    {
        if (buttons->getElement(i)->getSlotNumber() == buttonNumber)
        {
            buttons->getElement(i)->doClick()
        }
    }
}

method findButtonWithId(id)
{
    for (local(i) = 0; i < buttons->size(); i++)
    {
        if (buttons->getElement(i)->getSlotNumber() == id)
        {
            return buttons->getElement(i)   
        }
    }   
    
    return null
}