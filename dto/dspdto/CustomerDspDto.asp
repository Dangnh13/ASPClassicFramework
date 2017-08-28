<%

class CustomerDspDto

      private mMetadata

      '=============================
      'Private properties

      private  mId
      
      private  mName
       
      private  mPhone

      private  mDescription

      private  mStatus
      private  mCreateDatetime
      private  mUpdateDatetime
      private sub Class_Initialize()
          mMetadata = Array("id",  "name",  "phone",  "description",  "status",  "create_datetime",  "update_datetime" )
      end sub

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
       
      public property get Description()
        Description = mDescription
      end property

      public property let Description(val)
        mDescription = val
      end property

      public property get Status()
        Status = mStatus
      end property

      public property let Status(val)
        mStatus = val
      end property

       public property get CreateDatetime()
        CreateDatetime = mCreateDatetime
      end property

      public property let CreateDatetime(val)
        mCreateDatetime = val
      end property

      
      public property get UpdateDatetime()
        UpdateDatetime = mUpdateDatetime
      end property

      public property let UpdateDatetime(val)
        mUpdateDatetime = val
      end property

      public property get metadata()
        metadata = mMetadata
      end property

end class

%>
    