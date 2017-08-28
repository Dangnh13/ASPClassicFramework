<%

class CustomerSearchForm

      '=============================
      'Private properties

      private  mId

      private  mName
       
      private  mPhone

      private  mStatus
    
      private  mDescription

      private  mCreateDateFrom

      private  mCreateDateTo


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

        public property get CreatedDateFrom()
        CreatedDateFrom = mCreateDateFrom
      end property

      public property let CreatedDateFrom(val)
        mCreateDateFrom = val
      end property

      
      public property get CreatedDateTo()
        CreatedDateTo = mCreateDateTo
      end property

      public property let CreatedDateTo(val)
        mCreateDateTo = val
      end property

end class

%>
    