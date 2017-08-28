<%
'**
'* Represents a collection of objects.
'* @author Tony Kramer <flamewave4@gmail.com>
'* @version 1.0
'**
class Collection
	private m_data
	private m_size 'zero based size.

	'**
	'* Constructor.
	'**
	private sub Class_Initialize()
	    m_size = -1
		m_data = array()
	end sub

	'**
	'* Gets or sets a collection item at the specified index.
	'**
	public default property get Item(ByVal p_index)
		if p_index < 0 or p_index > m_size then exit property
		if isobject(m_data(p_index)) then
			set Item = m_data(p_index)
		else
			Item = m_data(p_index)
		end if
	end property
	public property let Item(ByVal p_index, ByRef p_value)
		if p_index < 0 then exit property
		if p_index > m_size then
			me.Add(p_value)
		else
			if isobject(p_value) then
				set m_data(p_index) = p_value
			else
				m_data(p_index) = p_value
			end if
		end if
	end property

	'**
	'* Gets an array of the collection items.
	'**
	public property get DataArray()
	    dim i, v_array()
	    redim v_array(m_size)
	    for i = 0 to m_size
	        v_array(i) = m_data(i)
	    next
		DataArray = v_array
	end property

	'**
	'* Gets the number of items in the collection.
	'**
	public property get Count()
		Count = m_size + 1
	end property

	'**
	'* Adds an item to the end of the collection.
	'* @param p_value (ref object) - The object to add to the collection.
	'* @returns (int) The index that the item was added at.
	'**
	public function Add(ByRef p_value)
        m_size = m_size + 1
        call EnsureCapacity(m_size)
		if isobject(p_value) then
			set m_data(m_size) = p_value
		else
			m_data(m_size) = p_value
		end if
		Add = m_size
	end function

	'**
	'* Adds all of the items of the passed array to the end of the collection.
	'* @param p_valueArray (ref Array) - The array of the objects to add to the end of the colleciton.
	'**
	public function AddItems(ByRef p_valueArray)
		dim v_count: v_count = ubound(p_valueArray)
		if v_count >= 0 then
		    call EnsureCapacity(m_size + v_count + 1)
            dim i
			for i = 0 to v_count
			    m_size = m_size + 1
				if isobject(p_valueArray(i)) then
					set m_data(m_size) = p_valueArray(i)
				else
					m_data(m_size) = p_valueArray(i)
				end if
			next
		end if
	end function

	'**
	'* Inserts the specified value into the collection at the specified index.
	'* @param p_index (int) - The index at which to insert the item into the collection.
	'* @param p_value (ref object) - The object to insert into the collection.
	'**
	public function Insert(ByVal p_index, ByRef p_value)
	    if p_index < 0 or p_index > (m_size + 1) then exit function
		m_size = m_size + 1
        call EnsureCapacity(m_size)
		dim i: i = m_size
		do until i < p_index
			if isobject(m_data(i - 1)) then
				set m_data(i) = m_data(i - 1)
			else
				m_data(i) = m_data(i - 1)
			end if
			i = i - 1
		loop
		if isobject(p_value) then
			set m_data(p_index) = p_value
		else
			m_data(p_index) = p_value
		end if
	end function

	'**
	'* Removes the specified item from the collection.
	'* @param p_value (ref object) - The object to remove from the collection.
	'**
	public function Remove(ByRef p_value)
		call me.RemoveAt(me.IndexOf(p_value))
	end function

	'**
	'* Removes the item at the specified index of the collection and compacts the collection.
	'* @param p_index (int) - The index of the item to remove from the collection.
	'**
	public function RemoveAt(ByVal p_index)
		if p_index < 0 or p_index > m_size then exit function
		dim i
		for i = p_index to m_size - 1
			if isobject(m_data(i + 1)) then
				set m_data(i) = m_data(i + 1)
			else
				m_data(i) = m_data(i + 1)
			end if
		next
		set m_data(m_size) = nothing
		m_size = m_size - 1
	end function

	'**
	'* Gets the index of the specified item in the collection if it exists in the collection.
	'* @param p_value (ref object) - The item to find the index of in the collection.
	'* @returns (int) The index of the item in the collection, or -1 if it was not found.
	'**
	public function IndexOf(ByRef p_value)
		IndexOf = -1
		dim i
		for i = 0 to m_size
			if m_data(i) = p_value then
				IndexOf = i
				exit for
			end if
		next
	end function

	'**
	'* Gets a value indicating if the specified item is in the collection.
	'* @param p_value (ref object) - The item to find in the collection.
	'* @returns (bool) TRUE if the item is in the collection, otherwise, FALSE.
	'**
	public function Contains(ByRef p_value)
		Contains = (me.IndexOf(p_value) <> -1)
	end function

	'**
	'* Clears all items from the collection.
	'**
	public function Clear()
		dim i
		for i = 0 to m_size
			set m_data(i) = nothing
		next
		m_data = array()
		m_size = -1
	end function

	'**
	'* Joins the data in the collection into a string using the specified delimiter between each item.
	'* @param p_delimiter (string) - The delimiter to use between each collection item in the returned string.
	'* @return (string) A string containing the string representation of all of the collection items separated by the specified delimiter.
	'**
	public function JoinData(ByVal p_delimiter)
		dim i
		JoinData = ""
		on error resume next
		for i = 0 to m_size
			if i > 0 then
				JoinData = JoinData & p_delimiter
			end if
			if isobject(m_data(i)) then
				JoinData = JoinData & m_data(i).ToString()
				if err.number = 438 then
					JoinData = JoinData = "[Object: " & TypeName(m_data(i)) & "]"
				end if
				err.clear
			else
				JoinData = JoinData & m_data(i)
			end if
		next
		on error goto 0
	end function

	'**
	'* Returns the contents of the collection in a formatted string ready for printing.
	'* @return (string) The string representation of the collection.
	'**
	public function ToString()
		dim i, v_string, v_temp
		v_string = ""
		if m_size >= 0 then
			on error resume next
			for i = 0 to m_size
				if isobject(m_data(i)) then
					v_temp = m_data(i).ToString()
					if err.number = 438 then
						v_temp = "[Object: " & TypeName(m_data(i)) & "]"
					end if
					err.clear
					v_string = v_string & "[" & i & "] = " & v_temp & vbCrLf
				else
					v_string = v_string & "[" & i & "] = " & m_data(i) & vbCrLf
				end if
			next
			on error goto 0
		else
			v_string = "No items in collection." & vbCrLf
		end if
		ToString = v_string
	end function

	'**
	'* Copies the values of this object instance to the specified object instance.
	'* @param p_value (ref Collection) - The object instance to copy the values to.
	'**
	public function CopyTo(ByRef p_value)
		dim i
		for i = 0 to m_size
			call p_value.Add(m_data(i))
		next
	end function

	'**
	'* Creates a copy of this instance and returns it.
	'* @return (Collection) An exact copy of this isntance.
	'**
	public function Clone()
		dim v_object: set v_object = new Collection
		call me.CopyTo(v_object)
		set Clone = v_object
	end function
	
	private function EnsureCapacity(ByVal p_min)
        dim v_ub: v_ub = ubound(m_data)
        if v_ub < p_min then
            dim v_num
            if v_ub <= 0 then
                v_num = 4
            else
                v_num = v_ub * 2
            end if
            if v_num < p_min then v_num = p_min
            redim preserve m_data(v_num)
        end if
    end function
end class
%>