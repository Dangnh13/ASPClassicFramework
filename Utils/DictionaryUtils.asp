<%
	Class DictionaryUtils
        public function ActiveFlag()
			Dim d
			Set d=Server.CreateObject("Scripting.Dictionary")
			d.Add "","All"
			d.Add "0","InActive"
			d.Add "1","Active"
			set ActiveFlag = d
        end function

        public function isEqual(d1, d2)
            
			set isEqual = true
        end function
	End Class
	
	dim dictionary : set dictionary = new DictionaryUtils
	 
%>