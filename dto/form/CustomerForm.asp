<%

class CustomerForm

      '=============================
      'Private properties
      private  mId

      private  mName
       
      private  mPhone

      private  mStatus
    
      private  mDescription

      private sub Class_Terminate()
      end sub

      '=============================
      'public properties

      public property get Id()
        Id = mId
      end property

      public property let Id(val)
        mId = val
      end property

      public property get Name()
        Name = mName
      end property

      public property let Name(val)
        mName = val
      end property
     
      public property get Phone()
        Phone = mPhone
      end property

      public property let Phone(val)
        mPhone = val
      end property
       
      public property get Status()
        Status = mStatus
      end property

      public property let Status(val)
        mStatus = val
      end property

       public property get Description()
        Description = mDescription
      end property

      public property let Description(val)
        mDescription = val
      end property

end class

%>
    