/**
* The FontType class represents fonts, which are use to render text in a visible way. 
*
* A FontType represents a native font on the current system, it can have many styles
* plain, bold, italic, bold and italic, its font size can also be set using pixel 
* values. The same FontType object can be used on multiple components lendning itself
* to code reuse.
*
* @author Joshua Michael Daly
* @version 0.1
*/
class FontType
{  
public:
    
    /*
    * *************************************************************************
    * Public Constructors
    * *************************************************************************
    */
    
    /**
    * Creates a new FontType based on the font name, style, and size specified.
    *
    * @param name font face that this FontType will represent
    * @param style either plain, bold, italic, or bold and italic
    * @param size font size in pixels
    */
    method FontType(name, style, size)
    {
        if (name == "")
        {
            name = "Arial"   
        }
        
        this->name = name
        this->style = style
        this->size = size 
    }
    
    /**
    * Creates a new FontType by copying the values in an existing FontType object.
    *
    * @param fontObject exisiting FontType to copy values from
    */
    method FontType(fontObject)
    {
        this->name = fontObject->name
        this->style = fontObject->style
        this->size = fontObject->size
    }
    
    /*
    * *************************************************************************
    * Public Getters and Setters
    * *************************************************************************
    */
    
    /**
    * Gets the FontType's font face.
    *
    * @return font face name
    */
    method getName()
    {
        return this->name   
    }
    
    /**
    * Sets the FontType's font face.
    *
    * @param value new font face
    */
    method setName(value)
    {
        this->name = value
    }
    
    /**
    * Gets the FontType's current style e.g. plain = 0, bold = 1, italic = 2, or bold and italic = 3.
    * 
    * @return current style
    */
    method getStyle()
    {
        return this->style
    }
    
    /**
    * Sets the FontType's current style e.g. plain = 0, bold = 1, italic = 2, bold and italic = 3.
    *
    * @param value font style to use
    */
    method setStyle(value)
    {
        this->style = value
    }
    
    /**
    * Gets the FontType's font size.
    *
    * @return font size in pixels
    */
    method getSize()
    {
        return this->size   
    }
    
    /**
    * Sets the FontType's font size in pixels.
    *
    * @param value font size in pixels
    */
    method setSize(value)
    {
        this->size = value   
    }
    
    /**
    * Returns a value indicating whether or not the font style is currently plain.
    *
    * @return true or false
    */
    method isPlain()
    {
        return this->style == 0  
    }
    
    /**
    * Returns a constant value of 0 which represent's the plain font style, if RPGCode allowed for
    * for it this would be a constant class member.
    *
    * @return constant value for plain style
    */
    method getPlainValue()
    {
        return 0
    }
    
    /**
    * Returns a value indicating whether or not the font style is currently bold.
    *
    * @return true or false
    */
    method isBold()
    {        
        if (this->style == 1)
        {
            return true
        }
        elseif(this->style == (3))
        {
            return true
        }
        
        return false
    }
    
    /**
    * Returns a constant value of 0 which represent's the bold font style, if RPGCode allowed for
    * for it this would be a constant class member.
    *
    * @return constant value for bol style
    */
    method getBoldValue()
    {
        return 1
    }
    
    /**
    * Returns a value indicating whether or not the font style is currently italic.
    *
    * @return true or false
    */
    method isItalic()
    {
       if (this->style == 2)
       {
            return true
       }
        elseif(this->style == (3))
       {
            return true
       }
        
       return false
    }
   
   /**
    * Returns a constant value of 0 which represent's the italic font style, if RPGCode allowed for
    * for it this would be a constant class member.
    *
    * @return constant value for italic style
    */
    method getItalicValue()
    {
        return 2
    }
    
    /**
    * Returns a constant value of 0 which represent's the bold and italic font style, if RPGCode allowed for
    * for it this would be a constant class member.
    *
    * @return constant value for bold and italic style
    */
    method getBoldAndItalicValue()
    {
       return 3
    }
    
private:
  
    var name
    var style
    var size
}