#include "rpgcode\slide\FontType.prg"

/**
* The base class for all RPGCode GUI components, it is effectively abstract.
*
* @author Joshua Michael Daly
* @version 0.1
*/
class Component
{
public:
    
    /*
    * *************************************************************************
    * Public Constructors
    * *************************************************************************
    */
    
    /**
    * Creates a new Component using some default values.
    */
    method Component()
    {
        this->setName("")
        this->setCanvas(createCanvas(0, 0))
        this->setParent("")
        this->setX(0)
        this->setY(0)
        this->setWidth(0)
        this->setHeight(0)
        this->setVisibility(true)
        this->setBackgroundImage("")
        this->setForegroundColour(255, 255, 255)
        this->setBackgroundColour(0, 0, 0)
        this->setFontType(local(currentFont) = FontType("Arial", 0, 20))
    }
    
    /**
    * Creates a new Component, setting its parent.
    *
    * @param parent Component's parent
    */
    method Component(parent)
    {
        this->Component()
        this->setParent(parent)
    }
    
    /*
    * *************************************************************************
    * Public Destructors
    * *************************************************************************
    */
    
    /**
    * Destroys a Component object, killing any attached resources that must be
    * explictly released.
    */
    method ~Component()
    {
        kill(canvas)
    }
    
    /*
    * *************************************************************************
    * Public Getters and Setters
    * *************************************************************************
    */
    
    /**
    * Gets the name of this  omponent.
    *
    * @return name of the Component
    */
    method getName()
    {
        return name
    }
    
    /**
    * Sets the name of this component.
    *
    * @param value name for the Component
    */
    method setName(value)
    {
        name = value
    }
    
    /**
    * Gets the x position of the Component relative to its parent.
    *
    * @return current x position
    */
    method getX()
    {
        return this->x   
    }
    
    /**
    * Sets the x position of the Component relative to its parent.
    *
    * @param value new x position
    */
    method setX(value)
    {
        this->x = value
    }
    
    /**
    * Gets the y position of the Component relative to its parent.
    *
    * @return current y position
    */
    method getY()
    {
        return this->y   
    }
    
    /**
    * Sets the y position of the Component relative to its parent.
    *
    * @param
    */
    method setY(value)
    {
        this->y = value
    }
    
    /**
    * Gets the location of the Component relative to its parent, it returns
    * both the x and y coordinates in a delimited string.
    *
    * @return current (x, y) coordinate in a delimited string
    */
    method getLocation()
    {
        return this->getx() + "," + this->getY()
    }
    
    /**
    * Sets the location of the Component relative to its parent.
    *
    * @param valueX new x position
    * @param valueY new y position
    */
    method setLocation(valueX, valueY)
    {
        this->setX(valueX) 
        this->setY(valueY)
    }
    
    /**
    * Gets the width in pixels of the Component.
    *
    * @return width in pixels
    */    
    method getWidth()
    {
        return width
    }
    
    /**
    * Sets the width of the Component.
    *
    * @param value width in pixels
    */
    method setWidth(value)
    {
        width = value
    }
    
    /**
    * Gets the height in pixels of the Component.
    *
    * @return height in pixels
    */ 
    method getHeight()
    {
        return height
    }
    
    /**
    * Sets the height of the Component.
    *
    * @param value heigth in pixels
    */
    method setHeight(value)
    {
        height = value
    }
    
    /**
    * Gets the size of the Component, it returns both the width and height
    * in a delimited string.
    *
    * @return width and height in a delimited string
    */
    method getSize()
    {
        return this->getWidth() + "," + this->getHeight()
    }
    
    /**
    * Sets the size of the Component.
    *
    * @param valueX new width in pixels
    * @param valueY new height in pixels
    */
    method setSize(valueX, valueY)
    {
        this->setWidth(valueX)
        this->setHeight(valueY)
    }
    
    /**
    * Gets the Component's drawing canvas.
    *
    * @return component's canvas
    */
    method getCanvas()
    {
        return canvas
    }
    
    /**
    * Sets the Component's drawing canvas.
    *
    * @param value new drawing canvas.
    */
    method setCanvas(value)
    {
        canvas = value
    }
    
    /**
    * Gets the Component's parent.
    *
    * @return component's parent object
    */
    method getParent()
    {
        return parent
    }
    
    /**
    * Sets the Component's parent.
    *
    * @param value new parent object
    */
    method setParent(value)
    {
        parent = value
    }
    
    /**
    * Gets the Component's visiblity.
    * 
    * @return Component's visibilty
    */
    method isVisible()
    {
        return visible
    }  
    
    /**
    * Sets the Component's visibility.
    *
    * @param value true or false value, to toggle Component's visibility
    */
    method setVisibility(value)
    {
        visible = value
    } 
    
    /**
    * Gets the Component's background image, if any.
    *
    * @return path to Component's background image
    */
    method getBackgroundImage()
    {
        return backgroundImage
    }
  
    /**
    * Sets the Component's background image.
    * 
    * @param value path to an image file
    */
    method setBackgroundImage(value)
    {
        backgroundImage = value
    }
    
    /**
    * Gets the Component's foreground rgb colour as a delimited string.
    *
    * @return Component's foreground rgb colour as a delimited string
    */
    method getForegroundColour()
    {
        local(rgb) = foregroundColour[0] + "," + foregroundColour[1] + "," + foregroundColour[2]
        
        return rgb
    }
    
    /**
    * Sets the Component's foreground colour to an rgb value.
    *
    * @param r r value
    * @param g g value
    * @param b b value
    */
    method setForegroundColour(r, g, b)
    {
        foregroundColour[0] = r
        foregroundColour[1] = g
        foregroundColour[2] = b
    }
    
    /**
    * Gets the Component's background rgb colour as a delimited string.
    *
    * @return Component's background rgb colour as a delimited string
    */
    method getBackgroundColour()
    {
        local(rgb) = backgroundColour[0] + "," + backgroundColour[1] + "," + backgroundColour[2]
        
        return rgb
    }
    
    /**
    * Sets the Component's background colour to an rgb value. 
    *
    * @param r r value
    * @param g g value
    * @param b b value
    */
    method setBackgroundColour(r, g, b)
    {
        backgroundColour[0] = r
        backgroundColour[1] = g
        backgroundColour[2] = b
    }
    
    /**
    * Gets the Component's FontType.
    *
    * @return current FontType
    * @see FontType
    */
    method getFontType()
    {
        return this->fontType
    }
    
    /**
    * Sets the Component's FontType.
    *
    * @param value new font to use
    * @see FontType
    */
    method setFontType(value)
    {
        this->fontType = value
    }
    
private:
   
    var name
    var canvas
    var parent
    var x
    var y
    var width
    var height
    var visible
    var backgroundImage
    var foregroundColour[]
    var backgroundColour[]
    var fontType
}