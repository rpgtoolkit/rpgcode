// based on java.util ArrayList
// unfinished.
class ArrayList
{
public:
    
    method ArrayList()
    {
        this->ArrayList(10)
    }
    
    method ArrayList(initialCapacity)
    {
        if (initialCapacity < 0)
        {
            debugger("Initial capacity is less than 0!")
            return 0
        }
       
        this->arraySize = 0
        this->elementData[initialCapacity]
    }
  
    method size()
    {
        return this->arraySize  
    }  
   
    method isEmpty()
    {
        return this->arraySize == 0
    }
    
    method toArray()
    {
       
    }
    
    method getElement(index)
    {
        if (this->checkRange(index))
        {
            return this->elementData[index]
        }
    }
    
    method setElement(index, element)
    {
        if (this->checkRange(index))
        {
            this->elementData[index] = element
        }
    }
    
    method indexOf(element)
    {
        if (element == null)
        {
            for (local(i) = 0; i < this->arraySize; i++)
            {
                if (this->elementData[i] == null)
                {
                    return i
                }   
            }
        }
        else
        {
            for (local(i) = 0; i < this->arraySize; i++)
            {
                // No object comparison in RPGCode this
                // will fail.
                if (this->elementData[i] == element)
                {
                    return i
                }   
            }
        }
     
        return -1   
    }
    
    method addElement(element)
    {
        this->elementData[this->arraySize++] = element
    }
    
    method addElement(index, element)
    {
        if (this->checkRangeForAdd(index))
        {
            this->elementData[index] = element 
            this->arraySize++   
        }
    }
    
    method removeElement(element)
    {
        local(index) = this->indexOf(element)
        
        if (this->checkRange(index))
        {
            this->fastRemove(index)
        }
    }
    
    method clear()
    {
        for (local(i) = 0; i < this->arraySize; i++)
        {
            this->elementData[i] = null   
        }
        
        this->arraySize = 0
    }
    
private:
   
    var elementData[]
    var arraySize
    
    method grow(minimumCapacity)
    {
           
    }
    
    method checkRange(index)
    {
        if (index >= this->arraySize)
        {
            debugger("Range out of the bounds of this array!")
            
            return false
        }  
       
       return true 
    }
    
    method checkRangeForAdd(index)
    {
        if (index > this->arraySize || index < 0)
        {
            debugger("Add range out of the bounds of this array!")
            
            return false
        } 
      
      return true  
    }
  
    method fastRemove(index)
    {
        local(numberMoved) = this->arraySize - index - 1
     
        if (numberMoved > 0)
        {
            for (local(i) = numberMoved; i > 0; i--)
            {
                this->elementData[i] = this->elementData[index++]   
            }
        }
     
        this->elementData[--this->arraySize] = null   
    }
}