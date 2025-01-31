#tag Class
Protected Class configJSON
	#tag Method, Flags = &h0
		Function read() As boolean
		  using EinhugurJSON
		  
		  dim root as New JSONObject()
		  
		  dim earr As JSONArray = new JSONArray()
		  dim kvarr as JSONArray = new JSONArray()
		  dim harr As JSONArray = new JSONArray()
		  
		  root("Enumerations") = earr
		  
		  root("Values") = kvarr
		  
		  root("Hosts") =harr
		  
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub write(o as object)
		  // write test data
		  
		  hostName = "esx01.fvh.fi"
		  staHost = New staHostInfo
		  staHost.hostName = "api.fvh.fi"
		  staHost.hostPort = 4403
		  
		  // convert all properties into JSON objects
		  
		  dim cDictArray() as Xojo.Core.Dictionary
		  dim d as Xojo.Core.Dictionary
		  
		  // get all the properties of this class instance
		  
		  dim props() as Introspection.PropertyInfo = Introspection.GetType(o).GetProperties
		  
		  for i as integer = 0 to uBound(props)
		    
		    d = New Xojo.Core.Dictionary
		    
		    // TODO other property types than text/string
		    
		    d.Value(props(i).name) = props(i).value(o)
		    
		    cDictArray.append(d)
		    
		  next
		  
		  // create json and write new config
		  
		  dim confFile as FolderItem = SpecialFolder.Preferences
		  
		  if confFile <> Nil then
		    dim f as FolderItem = confFile.Child("com.fvh.RandomThings.config")
		    if f<>nil then
		      
		      if f.exists then f.delete()
		      
		      Try
		        dim t as TextOutputStream = TextOutputStream.Create(f)
		        t.write(ConvertEncoding(Xojo.Data.GenerateJSON(cDictArray),Encodings.UTF8))
		        t.Close
		      Catch e as IOException
		        //handle with care
		      End Try
		    end
		  end
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return str(app.MajorVersion)+"."+str(app.MinorVersion)+"."+str(app.NonReleaseVersion)
			End Get
		#tag EndGetter
		appVersion As string
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		hostName As Text = "esx01.domain.lan"
	#tag EndProperty

	#tag Property, Flags = &h0
		staHost As staHostInfo
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="appVersion"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hostName"
			Group="Behavior"
			InitialValue="esx01.domain.lan"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
