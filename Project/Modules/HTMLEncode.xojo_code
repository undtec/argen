#tag Module
Protected Module HTMLEncode
	#tag Method, Flags = &h1
		Protected Function EncodeEntities(sInput as String) As String
		  var rg as RegEx
		  var match as RegExMatch
		  var tmp as String = sInput
		  
		  Initialise()
		  
		  ' Replace every HTML entity character with their corresponding HTML entity symbol
		  for each vChar as Variant in characters.Keys
		    var sChar as String = vChar
		    
		    if sChar = "&" then continue ' skip ampersands for the moment...
		    if sChar = "ß" then continue ' skip as Xojo seems to mistake `ss` for ß
		    
		    tmp = ReplaceAll(tmp, sChar, characters.Value(sChar))
		    
		  next vChar
		  
		  ' We need to find all ampersands that aren't part of an HTML symbol and replace
		  ' them with &amp;
		  rg = new RegEx
		  rg.SearchPattern = AMPERSAND_REGEX
		  rg.ReplacementPattern = "&amp;"
		  rg.Options.ReplaceAllMatches = True
		  
		  ' Run the RegEx search
		  match = rg.Search(tmp)
		  while match <> Nil
		    tmp = rg.Replace(tmp)
		    match = rg.Search(tmp)
		  wend
		  
		  return tmp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Initialise()
		  if characters = Nil then
		    characters = new Dictionary
		    
		    ' ASCII characters (printable)
		    characters.Value("&") = "&amp;"
		    characters.Value("<") = "&lt;"
		    characters.Value(">") = "&gt;"
		    
		    ' ISO-8859-1 characters
		    characters.Value("À") = "&Agrave;"
		    characters.Value("Á") = "&Aacute;"
		    characters.Value("Â") = "&Acirc;"
		    characters.Value("Ã") = "&Atilde;"
		    characters.Value("Ä") = "&Auml;"
		    characters.Value("Å") = "&Aring;"
		    characters.Value("Æ") = "&AElig;"
		    characters.Value("Ç") = "&Ccedil;"
		    characters.Value("È") = "&Egrave;"
		    characters.Value("É") = "&Eacute;"
		    characters.Value("Ê") = "&Ecirc;"
		    characters.Value("Ë") = "&Euml;"
		    characters.Value("Ì") = "&Igrave;"
		    characters.Value("Í") = "&Iacute;"
		    characters.Value("Î") = "&Icirc;"
		    characters.Value("Ï") = "&Iuml;"
		    characters.Value("Ð") = "&ETH;"
		    characters.Value("Ñ") = "&Ntilde;"
		    characters.Value("Ò") = "&Ograve;"
		    characters.Value("Ó") = "&Oacute;"
		    characters.Value("Ô") = "&Ocirc;"
		    characters.Value("Õ") = "&Otilde;"
		    characters.Value("Ö") = "&Ouml;"
		    characters.Value("Ø") = "&Oslash;"
		    characters.Value("Ù") = "&Ugrave;"
		    characters.Value("Ú") = "&Uacute;"
		    characters.Value("Û") = "&Ucirc;"
		    characters.Value("Ü") = "&Uuml;"
		    characters.Value("Ý") = "&Yacute;"
		    characters.Value("Þ") = "&THORN;"
		    characters.Value("ß") = "&szlig;"
		    characters.Value("à") = "&agrave;"
		    characters.Value("á") = "&aacute;"
		    characters.Value("â") = "&acirc;"
		    characters.Value("ã") = "&atilde;"
		    characters.Value("ä") = "&auml;"
		    characters.Value("å") = "&aring;"
		    characters.Value("æ") = "&aelig;"
		    characters.Value("ç") = "&ccedil;"
		    characters.Value("è") = "&egrave;"
		    characters.Value("é") = "&eacute;"
		    characters.Value("ê") = "&ecirc;"
		    characters.Value("ë") = "&euml;"
		    characters.Value("ì") = "&igrave;"
		    characters.Value("í") = "&iacute;"
		    characters.Value("î") = "&icirc;"
		    characters.Value("ï") = "&iuml;"
		    characters.Value("ð") = "&eth;"
		    characters.Value("ñ") = "&ntilde;"
		    characters.Value("ò") = "&ograve;"
		    characters.Value("ó") = "&oacute;"
		    characters.Value("ô") = "&ocirc;"
		    characters.Value("õ") = "&otilde;"
		    characters.Value("ö") = "&ouml;"
		    characters.Value("ø") = "&oslash;"
		    characters.Value("ù") = "&ugrave;"
		    characters.Value("ú") = "&uacute;"
		    characters.Value("û") = "&ucirc;"
		    characters.Value("ü") = "&uuml;"
		    characters.Value("ý") = "&yacute;"
		    characters.Value("þ") = "&thorn;"
		    characters.Value("ÿ") = "&yuml;"
		    
		    ' ISO-8859-1 symbols
		    characters.Value("¡") = "&iexcl;"
		    characters.Value("¢") = "&cent;"
		    characters.Value("£") = "&pound;"
		    characters.Value("¤") = "&curren;"
		    characters.Value("¥") = "&yen;"
		    characters.Value("¦") = "&brvbar;"
		    characters.Value("§") = "&sect;"
		    characters.Value("¨") = "&uml;"
		    characters.Value("©") = "&copy;"
		    characters.Value("ª") = "&ordf;"
		    characters.Value("«") = "&laquo;"
		    characters.Value("¬") = "&not;"
		    characters.Value("®") = "&reg;"
		    characters.Value("¯") = "&macr;"
		    characters.Value("°") = "&deg;"
		    characters.Value("±") = "&plusmn;"
		    characters.Value("²") = "&sup2;"
		    characters.Value("³") = "&sup3;"
		    characters.Value("´") = "&acute;"
		    characters.Value("µ") = "&micro;"
		    characters.Value("¶") = "&para;"
		    characters.Value("¸") = "&cedil;"
		    characters.Value("¹") = "&sup1;"
		    characters.Value("º") = "&ordm;"
		    characters.Value("»") = "&raquo;"
		    characters.Value("¼") = "&frac14;"
		    characters.Value("½") = "&frac12;"
		    characters.Value("¾") = "&frac34;"
		    characters.Value("¿") = "&iquest;"
		    characters.Value("×") = "&times;"
		    characters.Value("÷") = "&divide;"
		    
		    ' Math symbols
		    characters.Value("∀") = "&forall;"
		    characters.Value("∂") = "&part;"
		    characters.Value("∃") = "&exist;"
		    characters.Value("∅") = "&empty;"
		    characters.Value("∇") = "&nabla;"
		    characters.Value("∈") = "&isin;"
		    characters.Value("∉") = "&notin;"
		    characters.Value("∋") = "&ni;"
		    characters.Value("∏") = "&prod;"
		    characters.Value("∑") = "&sum;"
		    characters.Value("−") = "&minus;"
		    characters.Value("∗") = "&lowast;"
		    characters.Value("√") = "&radic;"
		    characters.Value("∝") = "&prop;"
		    characters.Value("∞") = "&infin;"
		    characters.Value("∠") = "&ang;"
		    characters.Value("∧") = "&and;"
		    characters.Value("∨") = "&or;"
		    characters.Value("∩") = "&cap;"
		    characters.Value("∪") = "&cup;"
		    characters.Value("∫") = "&int;"
		    characters.Value("∴") = "&there4;"
		    characters.Value("∼") = "&sim;"
		    characters.Value("≅") = "&cong;"
		    characters.Value("≈") = "&asymp;"
		    characters.Value("≠") = "&ne;"
		    characters.Value("≡") = "&equiv;"
		    characters.Value("≤") = "&le;"
		    characters.Value("≥") = "&ge;"
		    characters.Value("⊂") = "&sub;"
		    characters.Value("⊃") = "&sup;"
		    characters.Value("⊄") = "&nsub;"
		    characters.Value("⊆") = "&sube;"
		    characters.Value("⊇") = "&supe;"
		    characters.Value("⊕") = "&oplus;"
		    characters.Value("⊗") = "&otimes;"
		    characters.Value("⊥") = "&perp;"
		    characters.Value("⋅") = "&sdot;"
		    
		    ' Greek letters
		    characters.Value("Α") = "&Alpha;"
		    characters.Value("Β") = "&Beta;"
		    characters.Value("Γ") = "&Gamma;"
		    characters.Value("Δ") = "&Delta;"
		    characters.Value("Ε") = "&Epsilon;"
		    characters.Value("Ζ") = "&Zeta;"
		    characters.Value("Η") = "&Eta;"
		    characters.Value("Θ") = "&Theta;"
		    characters.Value("Ι") = "&Iota;"
		    characters.Value("Κ") = "&Kappa;"
		    characters.Value("Λ") = "&Lambda;"
		    characters.Value("Μ") = "&Mu;"
		    characters.Value("Ν") = "&Nu;"
		    characters.Value("Ξ") = "&Xi;"
		    characters.Value("Ο") = "&Omicron;"
		    characters.Value("Π") = "&Pi;"
		    characters.Value("Ρ") = "&Rho;"
		    characters.Value("Σ") = "&Sigma;"
		    characters.Value("Τ") = "&Tau;"
		    characters.Value("Υ") = "&Upsilon;"
		    characters.Value("Φ") = "&Phi;"
		    characters.Value("Χ") = "&Chi;"
		    characters.Value("Ψ") = "&Psi;"
		    characters.Value("Ω") = "&Omega;"
		    characters.Value("α") = "&alpha;"
		    characters.Value("β") = "&beta;"
		    characters.Value("γ") = "&gamma;"
		    characters.Value("δ") = "&delta;"
		    characters.Value("ε") = "&epsilon;"
		    characters.Value("ζ") = "&zeta;"
		    characters.Value("η") = "&eta;"
		    characters.Value("θ") = "&theta;"
		    characters.Value("ι") = "&iota;"
		    characters.Value("κ") = "&kappa;"
		    characters.Value("λ") = "&lambda;"
		    characters.Value("μ") = "&mu;"
		    characters.Value("ν") = "&nu;"
		    characters.Value("ξ") = "&xi;"
		    characters.Value("ο") = "&omicron;"
		    characters.Value("π") = "&pi;"
		    characters.Value("ρ") = "&rho;"
		    characters.Value("ς") = "&sigmaf;"
		    characters.Value("σ") = "&sigma;"
		    characters.Value("τ") = "&tau;"
		    characters.Value("υ") = "&upsilon;"
		    characters.Value("φ") = "&phi;"
		    characters.Value("χ") = "&chi;"
		    characters.Value("ψ") = "&psi;"
		    characters.Value("ω") = "&omega;"
		    characters.Value("ϑ") = "&thetasym;"
		    characters.Value("ϒ") = "&upsih;"
		    characters.Value("ϖ") = "&piv;"
		    
		    ' Miscellaneous HTML entities
		    characters.Value("Œ") = "&OElig;"
		    characters.Value("œ") = "&oelig;"
		    characters.Value("Š") = "&Scaron;"
		    characters.Value("š") = "&scaron;"
		    characters.Value("Ÿ") = "&Yuml;"
		    characters.Value("ƒ") = "&fnof;"
		    characters.Value("ˆ") = "&circ;"
		    characters.Value("˜") = "&tilde;"
		    characters.Value("–") = "&ndash;"
		    characters.Value("—") = "&mdash;"
		    characters.Value("‘") = "&lsquo;"
		    characters.Value("’") = "&rsquo;"
		    characters.Value("‚") = "&sbquo;"
		    characters.Value("“") = "&ldquo;"
		    characters.Value("”") = "&rdquo;"
		    characters.Value("„") = "&bdquo;"
		    characters.Value("†") = "&dagger;"
		    characters.Value("‡") = "&Dagger;"
		    characters.Value("•") = "&bull;"
		    characters.Value("…") = "&hellip;"
		    characters.Value("‰") = "&permil;"
		    characters.Value("′") = "&prime;"
		    characters.Value("″") = "&Prime;"
		    characters.Value("‹") = "&lsaquo;"
		    characters.Value("›") = "&rsaquo;"
		    characters.Value("‾") = "&oline;"
		    characters.Value("€") = "&euro;"
		    characters.Value("™") = "&trade;"
		    characters.Value("←") = "&larr;"
		    characters.Value("↑") = "&uarr;"
		    characters.Value("→") = "&rarr;"
		    characters.Value("↓") = "&darr;"
		    characters.Value("↔") = "&harr;"
		    characters.Value("↵") = "&crarr;"
		    characters.Value("⌈") = "&lceil;"
		    characters.Value("⌉") = "&rceil;"
		    characters.Value("⌊") = "&lfloor;"
		    characters.Value("⌋") = "&rfloor;"
		    characters.Value("◊") = "&loz;"
		    characters.Value("♠") = "&spades;"
		    characters.Value("♣") = "&clubs;"
		    characters.Value("♥") = "&hearts;"
		    characters.Value("♦") = "&diams;"
		    
		  end if
		  
		  if symbols = Nil then 
		    symbols = new Dictionary
		    
		    for each vKey as Variant in characters.Keys
		      symbols.Value(characters.Value(vKey)) = vKey
		      
		    next vKey
		    
		  end
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		A module to encode HTML entity characters to their respective symbols and back again.
		
		Usage:
		
		using HTMLEncode
		var raw as Text = "<p>Copyright © 2016</p>"
		var encoded as Text = raw.EncodeEntities()
		
		' result is:
		' &lt;p&gt;Copyright &copy; 2016&lt;/p&gt;
		
		Inspired by Thom McGrath's HTMLEntities module:
		https://www.thezaz.com/blog/real_studio/converting_html_entities/
		
		but rewritten to use faster Dictionaries and migrated as much as possible to the new Xojo framework. 
		I sure wish Xojo would add RegEx support to it though...
		
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			A Dictionary of HTMLEntities where the Key is the character and the Value is the symbol.
		#tag EndNote
		Private characters As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			A Dictionary of HTMLEntities where the Key is the symbol and the Value is the character.
		#tag EndNote
		Private symbols As Dictionary
	#tag EndProperty


	#tag Constant, Name = AMPERSAND_REGEX, Type = Text, Dynamic = False, Default = \"&(\?!(\\w+;))", Scope = Private
	#tag EndConstant

	#tag Constant, Name = VERSION, Type = Text, Dynamic = False, Default = \"1.2.6", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
