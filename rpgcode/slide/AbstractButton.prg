#include "rpgcode\slide\Component.prg"

/**
* Defines common behaviours for buttons. 
*
* @author Joshua Michael Daly
* @version 0.1
*/
class AbstractButton : Component
{
public:   
    /*
    * *************************************************************************
    * Public Getters and Setters
    * *************************************************************************
    */
    
    /**
    *
    *
    * @return
    */
    method isPressed()
    {
        return this->pressed   
    }
    
    /**
    *
    *
    * @param value
    */
    method setPressed(value)
    {
        this->pressed = value
    }
    
    /**
    *
    *
    * @return
    */
    method isRolledover()
    {
        return this->rolledover
    }
    
    /**
    *
    *
    * @param value
    */
    method setRolledOver(value)
    {
        this->rolledover = value
    }
    
    /**
    *
    *
    * @return
    */
    method isDisabled()
    {
        return this->isDisabled()
    }
    
    /**
    *
    *
    * @param value
    */
    method setDisabled(value)
    {
        this->isDisabled() = value
    }
    
    /**
    * Returns the button's text.
    *
    * @return the buttons text
    */
    method getText()
    {
        return this->textValue
    }
    
    /**
    * Sets the button's text.
    *
    * @param value the string used to set the text
    */
    method setText(value)
    {
        this->textValue = value
    }
    
    /**
    *
    *
    * @return
    */
    method getSlotNumber()
    {
        return this->slotNumber   
    }
    
    /**
    *
    *
    * @param value
    */
    method setSlotNumber(value)
    {
        if (value > 0)
        {   
            clearButtons(this->slotNumber)
            this->slotNumber = value  
            
            setButton("", this->slotNumber, this->getX(), this->getY(), this->calculateWidth(), this->calculateHeight()) 
        }
        else
        {
            debugger("Invalid slot value, the slot value must be greater than 0.")
        }   
    }

    /**
    * Returns the default icon.
    *
    * @return the default Icon
    */    
    method getDefaultIcon()
    {
        return this->defaultIcon
    }
    
    /**
    * Sets the button's default icon. This icon is
    * also used as the "pressed" and "disabled" icon if
    * there is no explicitly set pressed icon.
    *
    * @param value the icon used as the default image
    */
    method setDefaultIcon(value)
    {
        this->defaultIcon = value
    }
    
    /**
    * Returns the pressed icon for the button.
    *
    * @return the pressedIcon property
    */
    method getPressedIcon()
    {
        return this->pressedIcon
    }
    
    /**
    * Sets the pressed icon for the button.
    *
    * @param value the icon used as the "pressed" image
    */
    method setPressedIcon(value)
    {
        this->pressedIcon = value
    }

    /**
    * Returns the icon used by the button when it's disabled.
    *
    * @return the disabledIcon property
    */    
    method getDisabledIcon()
    {
        return this->disabledIcon
    }

    /**
    * Sets the disabled icon for the button.
    *
    * @param value the icon used as the disabled image
    */    
    method setDisabledIcon(value)
    {
        this->disabledIcon = value
    }

    /**
    * Returns the selected icon for the button. 
    *
    * @return the selectedIcon property
    */    
    method getSelectedIcon()
    {
        return this->selectedIcon
    }
    
    /**
    * Sets the selected icon for the button.
    *
    * @param value the icon used as the "selected" image
    */
    method setSelectedIcon(value)
    {
        this->selectedIcon = value
    }

    /**
    * Returns the icon used by the button when it's disabled and selected.
    *
    * @return the disabledSelectedIcon property
    */    
    method getDisabledSelectedIcon()
    {
        return this>disabledSelectedIcon
    }
    
    /**
    * Sets the disabled selection icon for the button.
    *
    * @param value the icon used as the disabled
    *          selection image
    */
    method setDisabledSelectedIcon(value)
    {
        this->disabledSelectedIcon = value
    }
    
    /**
    * Returns the rollover icon for the button.
    *
    * @return the rolloverIcon property
    */
    method getRolloverIcon()
    {
        return this->rolloverIcon
    }
    
    /**
    * Sets the rollover icon for the button.
    *
    * @param value the icon used as the "rollover" image
    */
    method setRolloverIcon(value)
    {
        this->rolloverIcon = value
    }
    
    /**
    * Returns the rollover selection icon for the button.
    *
    * @return the rolloverSelectedIcon property
    */
    method getRolloverSelectedIcon()
    {
        return this->rolloverSelectedIcon
    }

    /**
    * Sets the rollover selected icon for the button.
    *
    * @param value the icon used as the
    * "selected rollover" image
    */
    method setRolloverSelectedIcon(value)
    {
        this->rolloverSelectedIcon = value
    }
    
    /**
    *
    *
    * @return
    */
    method isPaintBorder()
    {
        return this->paintBorder
    }
    
    /**
    *
    *
    * @param value
    */
    method setPaintBorder(value)
    {
        this->paintBorder = value
    }
    
    /**
    *
    *
    * @return
    */
    method isPaintFocus()
    {
        return this->paintFocus
    }
    
    /**
    *
    *
    * @param value
    */
    method setPaintFocus(value)
    {
        this->paintFocus = value
    }

    /**
    * Gets the rolloverEnabled property.
    *
    * @return the value of the rolloverEnabled property
    */    
    method isRolloverEnabled()
    {
        return this->rolloverEnabled 
    }
    
    /**
    * Sets the rolloverEnabled property, which
    * must be true for rollover effects to occur.
    * The default value for the rolloverEnabled
    * property is false.
    *
    * @param value if true, rollover effects should be painted
    */
    method setRolloverEnabled(value)
    {
        this->rolloverEnabled = value
    }
    
    /**
    *
    *
    * @return
    */
    method isContentAreaFilled()
    {
        return this->contentAreaFilled
    }
    
    /**
    *
    *
    * @param value
    */
    method setContentAreaFilled(value)
    {
        this->contentAreaFilled = value
    }

    /**
    * Returns the vertical alignment of the text and icon.
    *
    * @return the verticalAlignment property
    */    
    method getVerticalAlignment()
    {
        return this->verticalAlignment
    }

    /**
    * Sets the vertical alignment of the icon and text.
    *
    * @param value
    */    
    method setVerticalAlignment(value)
    {
        this->verticalAlignment = value
    }

    /**
    * Returns the horizontal alignment of the icon and text.
    *
    * @return the horizontalAlignment property
    */    
    method getHorizontalAlignment()
    {
        return this->horizontalAlignment
    }

    /**
    * Sets the horizontal alignment of the icon and text.
    *
    * @param value the alignment value.
    */    
    method setHorizontalAlignment(value)
    {
        this->horizontalAlignment = value
    }
    
    /**
    * Returns the amount of space between the text and the icon
    * displayed in this button.
    *
    * @return an int equal to the number of pixels between the text
    *         and the icon.
    */
    method getIconTextGap()
    {
        return this->iconTextGap
    }
    
    /**
    * If both the icon and text properties are set, this property
    * defines the space between them.
    * 
    * The default value of this property is 4 pixels.
    * 
    * @param value then gap amount
    */
    method setIconTextGap(value)
    {
        this->iconTextGap = value
    }
    
    /**
    *
    *
    * @return
    */
    method isHideActionText()
    {
        return this->hideActionText
    }
    
    /**
    *
    *
    * @param value
    */
    method setHideActionText(value)
    {
        this->hideActionText = value
    }
    
    /*
    * *************************************************************************
    * Public Methods
    * *************************************************************************
    */
    
    /**
    *
    *
    * @param value
    * @param value
    */
    method initialise(textValue, icon)
    {
        if (textValue ~= "")
        {
            this->textValue = textValue   
        }
        
        if (icon ~= "")
        {
            this->defaultIcon = icon
        }
        
        this->pressed = false
        this->rolledover = false
        this->disabled = false
    }

    /**
    * Programmatically perform a "click". This does the same 
    * thing as if the user had pressed and released the button.
    */    
    method doClick()
    {
        this->doClick(0.25)   
    }
    
    /**
    * Programmatically perform a "click". This does the same
    * thing as if the user had pressed and released the button.
    * The button stays visually "presed" for "pressTime" 
    * milliseconds.
    *
    * @param pressTime the time to "hold down" the button in milliseconds
    */
    method doClick(pressTime)
    {
        this->pressed = true
        this->paint()
        delay(pressTime)
        this->pressed = false
        this->paint()
    }
    
private:
    
    // Model was external in AWT version
    var textValue
    var slotNumber
    var pressed
    var rolledover
    var disabled
    
    // Button Icons
    var defaultIcon
    var pressedIcon
    var disabledIcon
    
    var selectedIcon
    var disabledSelectedIcon
    
    var rolloverIcon
    var rolloverSelectedIcon
    
    // Display Properties
    var paintBorder
    var paintFocus
    var rolloverEnabled
    var contentAreaFilled
    
    // Icon/Label Alignment
    var verticalAlignment
    var horizontalAlignment
    
    var verticalTextPosition
    var horizontalTextPosition
    
    var iconTextGap
    
    var borderPaintedSet
    var rolloverEnabledSet
    var iconTextGapSet
    var contentAreaFilledSet
    
    var hideActionText
    
    /*
    * *************************************************************************
    * Private Methods
    * *************************************************************************
    */

    /**
    *
    *
    * @return
    */
    method calculateWidth()
    {
        if (this->getWidth() > 0)
        {
            return this->getWidth()   
        }
        elseif (this->textValue == "")
        {
            return this->getWidth()
        }
        else
        {
            // Make these adjustable.
            local(padding) = 10
            local(borderWidth) = 1
            
            local(width) = getTextWidth(this->getText()) + padding + borderWidth
            
            this->setWidth(width)
            
            return width
        }
    }
    
    /**
    *
    *
    * @return
    */
    method calculateHeight()
    {
        if (this->getHeight() > 0)
        {
            return this->getHeight()
        }
        elseif (this->textValue == "")
        {
            return this->getHeight()   
        }
        else
        {
            // Make these adjustable.
            local(padding) = 10
            local(borderWidth) = 1
            
            local(height) = getTextHeight(this->getText()) + padding + borderWidth
            
            this->setHeight(height)
            
            return height
        }
    }
}