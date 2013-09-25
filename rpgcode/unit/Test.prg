/**
* JUnit style test case class.
*
* @author Joshua Michael Daly
* @version 0.1
*/
class Test
{
public:
    
    /*
    * *************************************************************************
    * Public Constructors
    * *************************************************************************
    */
    
    /**
    * Creates an empty Test object.
    */
    method Test()
    {
        
    }
    
    /*
    * *************************************************************************
    * Public Methods
    * *************************************************************************
    */
    
    /**
    * Compare two objects for equality.
    *
    * @return true or false value
    */
    method compare(object, object2)
    {
        if (object == object2)
        {
            return true
        }
    
        return false    
    }
    
    /**
    * Test's to see if a condition is true, otherwise it displays an error message
    * using the RPGCode debugger.
    *
    * @param failMessage message to display on failure
    * @param condition condition to test
    */
    method assertTrue(failMessage, condition)
    {    
        if (condition == false)
        {
            debugger(failMessage)
        }
    }
 
    /**
    * Test's to see if a condition is false, otherwise it displays an error message
    * using the RPGCode debugger.
    *
    * @param failMessage message to display on failure
    * @param condition condition to test
    */
    method assertFalse(failMessage, condition)
    {
        if (condition == true)
        {
            debugger(failMessage) 
        }
    }   
}