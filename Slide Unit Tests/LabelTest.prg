#include "rpgcode\slide\Label.prg"
#include "rpgcode\slide\FontType.prg"

#include "rpgcode\unit\Test.prg"

// Simple JUnit style test for the Label class.

local(testCase) = LabelTest()
testCase->setUp()
testCase->testGetText()
testCase->testSetText()
testCase->testPaint()
wait()

class LabelTest : Test
{
public:
    
    method setUp()
    {
        this->timesFont = FontType("Times", FontType()->getPlainValue(), 20)
        this->verdanaFont = FontType("Verdana", FontType()->getBoldValue(), 15)
        this->comicFont = FontType("Comic Sans MS", FontType()->getItalicValue(), 25)
        this->georgiaFont = FontType("Georgia", FontType()->getBoldAndItalicValue(), 50)
        
        this->timesText = "Hello Times!"
        this->verdanaText = "Hello Verdana!"
        this->comicText = "Hello Comic Sans MS!"
        this->georgiaText = "Hello Georgia!" 

        this->timesLabel = Label(timesText)
        this->timesLabel->setName("timesLabel")
        this->timesLabel->setX(10)
        this->timesLabel->setY(10)
        this->timesLabel->setBackgroundColour(100, 100, 100)
        this->timesLabel->setForegroundColour(255, 255, 255)
        this->timesLabel->setFontType(this->timesFont)
        
        this->verdanaLabel = Label(verdanaText)
        this->verdanaLabel->setName("verdanaLabel")
        this->verdanaLabel->setLocation(10, 50)
        this->verdanaLabel->setBackgroundColour(100, 100, 100)
        this->verdanaLabel->setForegroundColour(255, 255, 255)
        this->verdanaLabel->setFontType(verdanaFont)
        
        this->comicLabel = Label(comicText)
        this->comicLabel->setName("comicLabel")
        this->comicLabel->setLocation(10, 100)
        this->comicLabel->setBackgroundColour(100, 100, 100)
        this->comicLabel->setForegroundColour(255, 255, 255)
        this->comicLabel->setFontType(this->comicFont)
        
        this->georgiaLabel = Label(georgiaText)
        this->georgiaLabel->setName("georgiaLabel")
        this->georgiaLabel->setLocation(10, 150)
        this->georgiaLabel->setBackgroundColour(100, 100, 100)
        this->georgiaLabel->setForegroundColour(255, 255, 255)
        this->georgiaLabel->setFontType(this->georgiaFont)
    }

    method testGetText()
    {
        // Because we can't use this->timesLabel->getText() == this->timesText in RPGCode...
        local(result) = this->compare(this->timesLabel->getText(), this->timesText)
        this->assertTrue("Times Label text incorrect, value: " + this->timesLabel->getText(), result)
        
        result = this->compare(this->verdanaLabel->getText(), this->verdanaText)
        this->assertTrue("Verdana Label text incorrect, value: " + this->verdanaLabel->getText(), result)
        
        result = this->compare(this->comicLabel->getText(), this->comicText)
        this->assertTrue("Comic Label text incorrect, value: " + this->comicLabel->getText(), result)
        
        result = this->compare(this->georgiaLabel->getText(), this->georgiaText)
        this->assertTrue("Georgia Label text incorrect, value: " + this->georgiaLabel->getText(), result)
    }
    
    method testSetText()
    {   
        
        this->timesLabel->setText("Hello")
        // Because we can't use this->timesLabel->getText() == this->timesText in RPGCode...
        local(result) = this->compare(this->timesLabel->getText(), "Hello")
        this->assertTrue("", result)
        
        this->verdanaLabel->setText("World")
        result = this->compare(this->verdanaLabel->getText(), "World")
        this->assertTrue("", result)
        
        this->comicLabel->setText("of")
        result = this->compare(this->comicLabel->getText(), "of")
        this->assertTrue("", result)
        
        this->georgiaLabel->setText("RPGCode")
        result = this->compare(this->georgiaLabel->getText(), "RPGCode")
        this->assertTrue("", result)
    }

    method testPaint()
    {
        timesLabel->paint()
        verdanaLabel->paint()
        comicLabel->paint()
        georgiaLabel->paint()
    }
    
private:
    
    var timesText
    var verdanaText
    var comicText
    var georgiaText 
    
    var timesFont
    var verdanaFont
    var comicFont
    var georgiaFont

    var timesLabel
    var verdanaLabel
    var comicLabel
    var georgiaLabel
}

