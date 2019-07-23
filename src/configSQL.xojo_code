#tag Class
Protected Class configSQL
	#tag Method, Flags = &h0
		Function read() As boolean
		  
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function write() As boolean
		  
		  
		  return true
		End Function
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
	#tag EndViewBehavior
End Class
#tag EndClass
