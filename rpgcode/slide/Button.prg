#include "rpgcode\slide\AbstractButton.prg"
#include "rpgcode\slide\Component.prg" // Imported simply for autocomplete items.

class Button : AbstractButton
{
public:
    /*
    * *************************************************************************
    * Public Constructors
    * *************************************************************************
    */
    
    method Button()
    {
        this->Button("", "")
    }
    
    method Button(textValue, icon)
    {
        this->Component()
        this->initialise(textValue, icon)
    }
    
    method paint()
    {   
        if (this->isPressed())
        {
            this->paintPressed()
        }
        elseif (this->isRolledover())
        {
            this->paintRollover()   
        }
        //elseif(this->isDisabled())
        //{
        //    this->paintDisabled()
        //}
        else
        {
            this->paintNormal()
        }
    }
    
private:
    
    method paintNormal()
    {
        // Set the global font to this buttons font.
        // We need do this here so we can determine 
        // the size for the drawing canvas.
        font(this->getFontType()->getName())
        fontSize(this->getFontType()->getSize())
        
        if (this->getFontType()->isBold())
        {
            bold(true)
        }
        
        if (this->getFontType()->isItalic())
        {
            italics(true)
        }
        
        // Override the components width and height
        // values, it is unlikely that the user will 
        // only want to see part of a button.
        local(width)
        local(height)
        local(padding) = 10
        local(borderWidth) = 1
        width = getTextWidth(this->getText()) + padding + borderWidth
        height = getTextHeight(this->getText()) + padding + borderWidth

        // For performance reasons buttons with
        // 0x0 dimensions will not be drawn.
        if (width == 0 && height == 0)
        {
            return 0 // Must explictly return a value in RPGCode.
        }

        // Create the canvas for drawing to.
        this->setCanvas(createCanvas(width, height))
        
        // Draw the border.
        colorRGB(255, 255, 255)
        fillRect(0, 0, width, height, this->getCanvas())
        
        // Get the background colour to use for the canvas.
        local(backgroundColour) = this->getBackgroundColour()
        local(backgroundRGB[])
        split(backgroundColour, ",", backgroundRGB)
        
        // Draw the background colour.
        colorRGB(backgroundRGB[0], backgroundRGB[1], backgroundRGB[2])
        fillRect(borderWidth, borderWidth, width - (borderWidth * 2), height - (borderWidth * 2), this->getCanvas())
        
        // Get the foreground colour to use for the text.
        local(foregroundColour) = this->getForegroundColour()
        local(foregroundRGB[])
        split(foregroundColour, ",", foregroundRGB)
        
        // Draw the text.
        colorRGB(foregroundRGB[0], foregroundRGB[1], foregroundRGB[2])
        pixelText((padding / 2) + 1, (padding / 2) - 1, this->getText(), this->getCanvas())
        
        // Only draw the button if it should be visible.
        if (this->isVisible())
        {
            drawCanvas(canvas, this->getX(), this->getY())
        } 
    
        bold(false)
        italics(false) 
    }
    
    method paintPressed()
    {
        // Set the global font to this buttons font.
        // We need do this here so we can determine 
        // the size for the drawing canvas.
        font(this->getFontType()->getName())
        fontSize(this->getFontType()->getSize())
        
        if (this->getFontType()->isBold())
        {
            bold(true)
        }
        
        if (this->getFontType()->isItalic())
        {
            italics(true)
        }
        
        // Override the components width and height
        // values, it is unlikely that the user will 
        // only want to see part of a button.
        local(width)
        local(height)
        local(padding) = 10
        local(borderWidth) = 1
        width = getTextWidth(this->getText()) + padding + borderWidth
        height = getTextHeight(this->getText()) + padding + borderWidth

        // For performance reasons buttons with
        // 0x0 dimensions will not be drawn.
        if (width == 0 && height == 0)
        {
            return 0 // Must explictly return a value in RPGCode.
        }

        // Create the canvas for drawing to.
        this->setCanvas(createCanvas(width, height))
        
        // Draw the border.
        colorRGB(248, 68, 93)
        fillRect(0, 0, width, height, this->getCanvas())
        
        // Draw the background colour.
        colorRGB(122, 122, 122)
        fillRect(borderWidth, borderWidth, width - (borderWidth * 2), height - (borderWidth * 2), this->getCanvas())
        
        // Draw the text.
        colorRGB(0, 0, 0)
        pixelText((padding / 2) + 1, (padding / 2) - 1, this->getText(), this->getCanvas())
        
        // Only draw the button if it should be visible.
        if (this->isVisible())
        {
            drawCanvas(canvas, this->getX(), this->getY())
        } 
    
        bold(false)
        italics(false) 
    }
    
    method paintRollover()
    {
        // Set the global font to this buttons font.
        // We need do this here so we can determine 
        // the size for the drawing canvas.
        font(this->getFontType()->getName())
        fontSize(this->getFontType()->getSize())
        
        if (this->getFontType()->isBold())
        {
            bold(true)
        }
        
        if (this->getFontType()->isItalic())
        {
            italics(true)
        }
        
        // Override the components width and height
        // values, it is unlikely that the user will 
        // only want to see part of a button.
        local(width)
        local(height)
        local(padding) = 10
        local(borderWidth) = 1
        width = getTextWidth(this->getText()) + padding + borderWidth
        height = getTextHeight(this->getText()) + padding + borderWidth

        // For performance reasons buttons with
        // 0x0 dimensions will not be drawn.
        if (width == 0 && height == 0)
        {
            return 0 // Must explictly return a value in RPGCode.
        }

        // Create the canvas for drawing to.
        this->setCanvas(createCanvas(width, height))
        
        // Draw the border.
        colorRGB(173, 173, 173)
        fillRect(0, 0, width, height, this->getCanvas())
        
        // Draw the background colour.
        colorRGB(255, 255, 255)
        fillRect(borderWidth, borderWidth, width - (borderWidth * 2), height - (borderWidth * 2), this->getCanvas())
        
        // Draw the text.
        colorRGB(0, 0, 0)
        pixelText((padding / 2) + 1, (padding / 2) - 1, this->getText(), this->getCanvas())
        
        // Only draw the button if it should be visible.
        if (this->isVisible())
        {
            drawCanvas(canvas, this->getX(), this->getY())
        } 
    
        bold(false)
        italics(false) 
    }
    
    method paintDisabled()
    {
        // Set the global font to this buttons font.
        // We need do this here so we can determine 
        // the size for the drawing canvas.
        font(this->getFontType()->getName())
        fontSize(this->getFontType()->getSize())
        
        if (this->getFontType()->isBold())
        {
            bold(true)
        }
        
        if (this->getFontType()->isItalic())
        {
            italics(true)
        }
        
        // Override the components width and height
        // values, it is unlikely that the user will 
        // only want to see part of a button.
        local(width)
        local(height)
        local(padding) = 10
        local(borderWidth) = 1
        width = getTextWidth(this->getText()) + padding + borderWidth
        height = getTextHeight(this->getText()) + padding + borderWidth

        // For performance reasons buttons with
        // 0x0 dimensions will not be drawn.
        if (width == 0 && height == 0)
        {
            return 0 // Must explictly return a value in RPGCode.
        }

        // Create the canvas for drawing to.
        this->setCanvas(createCanvas(width, height))
        
        // Draw the border.
        colorRGB(173, 173, 173)
        fillRect(0, 0, width, height, this->getCanvas())
        
        // Draw the background colour.
        colorRGB(255, 255, 255)
        fillRect(borderWidth, borderWidth, width - (borderWidth * 2), height - (borderWidth * 2), this->getCanvas())
        
        // Draw the text.
        colorRGB(0, 0, 0)
        pixelText((padding / 2) + 1, (padding / 2) - 1, this->getText(), this->getCanvas())
        
        // Only draw the button if it should be visible.
        if (this->isVisible())
        {
            drawCanvas(canvas, this->getX(), this->getY())
        } 
    
        bold(false)
        italics(false) 
    }
}