#tag Window
Begin ContainerControl ccCustomize
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   300
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   600
   Begin Listbox lbClassTemplate
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   24
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   236
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Class"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   30
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label lblHeading
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Customize Class Template"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   376
   End
   Begin LinkLabel lblHelp
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   368
      LinkURL         =   ""
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "More information on customization"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   True
      Underline       =   True
      Visible         =   False
      Width           =   232
   End
   Begin ListSegment ctlAddDel
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   277
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   50
   End
   Begin WindowSplitter ctlSplitter
      AutoDeactivate  =   True
      CursorSmoothing =   True
      DockAfter       =   False
      DockAfterSize   =   40
      DockBefore      =   False
      DockBeforeSize  =   40
      DoubleClickAction=   0
      Enabled         =   True
      Height          =   239
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   203
      LinuxStyle      =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacStyle        =   3
      MinAfterArea    =   380
      MinBeforeArea   =   200
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   26
      Visible         =   True
      Width           =   14
      WinLiveMove     =   True
      WinStyle        =   1
   End
   Begin PagePanel ppEditor
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   234
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   220
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   5
      Panels          =   ""
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   32
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   380
      Begin Label lblNoSelection
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEditor"
         Italic          =   False
         Left            =   240
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "No Selection"
         TextAlign       =   1
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   100
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   340
      End
      Begin ccConstantTemplate ctlEditConstant
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   234
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEditor"
         Left            =   220
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   32
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   380
      End
      Begin ccEventTemplate ctlEditEvent
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   234
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEditor"
         Left            =   220
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   32
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   380
      End
      Begin ccMethodTemplate ctlEditMethod
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   214
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEditor"
         Left            =   220
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Top             =   32
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   370
      End
      Begin ccPropertyTemplate ctlEditProperty
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   214
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEditor"
         Left            =   220
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         Top             =   32
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   380
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  PositionNoSelection
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  PositionNoSelection
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddConstant()
		  var toNew as new ARProject.CustomizationConstant
		  moProject.DataClass.CustomTemplate.aroConstants.Append(toNew)
		  
		  ReloadSection(ARProject.CustomizationTemplate.BlockType.Constant)
		  
		  self.TrueWindow.ContentsChanged = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddEvent()
		  var toNew as new ARProject.CustomizationEvent
		  moProject.DataClass.CustomTemplate.aroEvents.Append(toNew)
		  
		  ReloadSection(ARProject.CustomizationTemplate.BlockType.EventDefinition)
		  
		  self.TrueWindow.ContentsChanged = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddMethod(tbShared as Boolean)
		  var toNew as new ARProject.CustomizationMethod
		  toNew.bShared = tbShared
		  
		  moProject.DataClass.CustomTemplate.aroMethods.Append(toNew)
		  
		  if tbShared = false then
		    ReloadSection(ARProject.CustomizationTemplate.BlockType.ClassMethod)
		    
		  else
		    ReloadSection(ARProject.CustomizationTemplate.BlockType.SharedMethod)
		    
		  end
		  
		  self.TrueWindow.ContentsChanged = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddProperty(tbShared as Boolean)
		  var toNew as new ARProject.CustomizationProperty
		  toNew.bShared = tbShared
		  
		  moProject.DataClass.CustomTemplate.aroProperties.Append(toNew)
		  
		  if tbShared = false then
		    ReloadSection(ARProject.CustomizationTemplate.BlockType.ClassProperty)
		    
		  else
		    ReloadSection(ARProject.CustomizationTemplate.BlockType.SharedProperty)
		    
		  end
		  
		  self.TrueWindow.ContentsChanged = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearSection(tiHeaderRow as Integer)
		  // Clears out a single section when the header row is passed
		  if lbClassTemplate.Expanded(tiHeaderRow) = false then return
		  
		  var tiLastSectionRow as Integer = -1
		  
		  var tiLastRowIndex as Integer = lbClassTemplate.ListCount - 1
		  for ti as Integer = (tiHeaderRow + 1) to tiLastRowIndex
		    var tvTag as Variant = lbClassTemplate.RowTag(ti)
		    
		    // Next header
		    if tvTag.IsNumeric then
		      tiLastSectionRow = ti - 1
		      exit for ti
		      
		    elseif ti = tiLastRowIndex then
		      tiLastSectionRow = ti
		      
		    end
		    
		  next ti
		  
		  // Section is empty
		  if tiHeaderRow = tiLastSectionRow then return
		  
		  if tiLastSectionRow > -1 then
		    for ti as Integer = tiLastSectionRow downto (tiHeaderRow + 1)
		      lbClassTemplate.RemoveRow(ti)
		      
		    next ti
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDelete()
		  if lbClassTemplate.ListIndex < 0 then return
		  
		  var tvTag as Variant = lbClassTemplate.RowTag(lbClassTemplate.ListIndex)
		  
		  if tvTag.IsNumeric then return
		  
		  HandleDeleteTag(tvTag)
		  
		  self.TrueWindow.ContentsChanged = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteConstant(vTarget as Variant)
		  var toTarget as ARProject.CustomizationConstant = ARProject.CustomizationConstant(vTarget)
		  
		  for ti as Integer = moProject.DataClass.CustomTemplate.aroConstants.Ubound downto 0
		    var toThis as ARProject.CustomizationConstant = moProject.DataClass.CustomTemplate.aroConstants(ti)
		    
		    if toThis = toTarget then
		      moProject.DataClass.CustomTemplate.aroConstants.Remove(ti)
		      exit for ti
		      
		    end
		    
		  next ti
		  
		  ReloadSection(ARProject.CustomizationTemplate.BlockType.Constant)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteEvent(vTarget as Variant)
		  var toTarget as ARProject.CustomizationEvent = ARProject.CustomizationEvent(vTarget)
		  
		  for ti as Integer = moProject.DataClass.CustomTemplate.aroEvents.Ubound downto 0
		    var toThis as ARProject.CustomizationEvent = moProject.DataClass.CustomTemplate.aroEvents(ti)
		    
		    if toThis = toTarget then
		      moProject.DataClass.CustomTemplate.aroEvents.Remove(ti)
		      exit for ti
		      
		    end
		    
		  next ti
		  
		  ReloadSection(ARProject.CustomizationTemplate.BlockType.EventDefinition)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteMethod(vTarget as Variant)
		  var toTarget as ARProject.CustomizationMethod = ARProject.CustomizationMethod(vTarget)
		  
		  for ti as Integer = moProject.DataClass.CustomTemplate.aroMethods.Ubound downto 0
		    var toThis as ARProject.CustomizationMethod = moProject.DataClass.CustomTemplate.aroMethods(ti)
		    
		    if toThis = toTarget then
		      moProject.DataClass.CustomTemplate.aroMethods.Remove(ti)
		      exit for ti
		      
		    end
		    
		  next ti
		  
		  ReloadSection(ARProject.CustomizationTemplate.BlockType.ClassMethod)
		  ReloadSection(ARProject.CustomizationTemplate.BlockType.SharedMethod)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteProperty(vTarget as Variant)
		  var toTarget as ARProject.CustomizationProperty = ARProject.CustomizationProperty(vTarget)
		  
		  for ti as Integer = moProject.DataClass.CustomTemplate.aroProperties.Ubound downto 0
		    var toThis as ARProject.CustomizationProperty = moProject.DataClass.CustomTemplate.aroProperties(ti)
		    
		    if toThis = toTarget then
		      moProject.DataClass.CustomTemplate.aroProperties.Remove(ti)
		      exit for ti
		      
		    end
		    
		  next ti
		  
		  ReloadSection(ARProject.CustomizationTemplate.BlockType.ClassProperty)
		  ReloadSection(ARProject.CustomizationTemplate.BlockType.SharedProperty)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteTag(tvTag as Variant)
		  if not tvTag.IsNumeric then
		    if tvTag isa ARProject.CustomizationConstant then
		      HandleDeleteConstant(tvTag)
		      
		    elseif tvTag isa ARProject.CustomizationEvent then
		      HandleDeleteEvent(tvTag)
		      
		    elseif tvTag isa ARProject.CustomizationMethod then
		      HandleDeleteMethod(tvTag)
		      
		    elseif tvTag isa ARProject.CustomizationProperty then
		      HandleDeleteProperty(tvTag)
		      
		    end
		    
		  end
		  
		  self.TrueWindow.ContentsChanged = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InvalidateRow()
		  // Redraw to get new name
		  if lbClassTemplate.ListIndex > -1 then
		    lbClassTemplate.InvalidateCell(lbClassTemplate.ListIndex, 0)
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(toProject as DataFile.t_Project)
		  moProject = toProject
		  
		  lbClassTemplate.DeleteAllRows
		  lbClassTemplate.AddFolder("Constants")
		  lbClassTemplate.RowTag(lbClassTemplate.LastIndex) = ARProject.CustomizationTemplate.BlockType.Constant
		  
		  lbClassTemplate.AddFolder("Event Definitions")
		  lbClassTemplate.RowTag(lbClassTemplate.LastIndex) = ARProject.CustomizationTemplate.BlockType.EventDefinition
		  
		  lbClassTemplate.AddFolder("Methods")
		  lbClassTemplate.RowTag(lbClassTemplate.LastIndex) = ARProject.CustomizationTemplate.BlockType.ClassMethod
		  
		  lbClassTemplate.AddFolder("Properties")
		  lbClassTemplate.RowTag(lbClassTemplate.LastIndex) = ARProject.CustomizationTemplate.BlockType.ClassProperty
		  
		  lbClassTemplate.AddFolder("Shared Methods")
		  lbClassTemplate.RowTag(lbClassTemplate.LastIndex) = ARProject.CustomizationTemplate.BlockType.SharedMethod
		  
		  lbClassTemplate.AddFolder("Shared Properties")
		  lbClassTemplate.RowTag(lbClassTemplate.LastIndex) = ARProject.CustomizationTemplate.BlockType.SharedProperty
		  
		  #if TargetMacOS then
		    lblNoSelection.TextColor = NSColorMBS.secondaryLabelColor.colorValue
		    
		  #elseif TargetWindows then
		    lblNoSelection.TextColor = &c777777
		    
		  #endif
		  
		  PositionNoSelection
		  RestoreFolderStates
		  RecolorClassList
		  SetEnabledState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadConstants(tiBaseRow as Integer)
		  for ti as Integer = 0 to moProject.DataClass.CustomTemplate.aroConstants.Ubound
		    var toThis as ARProject.CustomizationConstant = moProject.DataClass.CustomTemplate.aroConstants(ti)
		    lbClassTemplate.InsertRow(tiBaseRow + ti + 1, toThis.sName, 1)
		    lbClassTemplate.RowTag(lbClassTemplate.LastIndex) = toThis
		    
		  next ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadEvents(tiBaseRow as Integer)
		  for ti as Integer = 0 to moProject.DataClass.CustomTemplate.aroEvents.Ubound
		    var toThis as ARProject.CustomizationEvent = moProject.DataClass.CustomTemplate.aroEvents(ti)
		    lbClassTemplate.InsertRow(tiBaseRow + ti + 1, toThis.sName, 1)
		    lbClassTemplate.RowTag(lbClassTemplate.LastIndex) = toThis
		    
		  next ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadMethods(tiBaseRow as Integer, tbShared as Boolean)
		  var tiAddedRows as Integer
		  
		  for ti as Integer = 0 to moProject.DataClass.CustomTemplate.aroMethods.Ubound
		    var toThis as ARProject.CustomizationMethod = moProject.DataClass.CustomTemplate.aroMethods(ti)
		    
		    // Make sure Shared setting is the one being requested
		    if toThis.bShared <> tbShared then continue for ti
		    
		    lbClassTemplate.InsertRow(tiBaseRow + tiAddedRows + 1, toThis.sName, 1)
		    lbClassTemplate.RowTag(lbClassTemplate.LastIndex) = toThis
		    
		    tiAddedRows = tiAddedRows + 1
		    
		  next ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadProperties(tiBaseRow as Integer, tbShared as Boolean)
		  var tiAddedRows as Integer
		  
		  for ti as Integer = 0 to moProject.DataClass.CustomTemplate.aroProperties.Ubound
		    var toThis as ARProject.CustomizationProperty = moProject.DataClass.CustomTemplate.aroProperties(ti)
		    
		    // Make sure Shared setting is the one being requested
		    if toThis.bShared <> tbShared then continue for ti
		    
		    lbClassTemplate.InsertRow(tiBaseRow + tiAddedRows + 1, toThis.sName, 1)
		    lbClassTemplate.RowTag(lbClassTemplate.LastIndex) = toThis
		    
		    tiAddedRows = tiAddedRows + 1
		    
		  next ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PositionNoSelection()
		  lblNoSelection.Top = (self.Height * 0.20) + ppEditor.Top
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RecolorClassList()
		  redim marbAlternateColors(-1)
		  var tbAlternate as Boolean = true
		  
		  for ti as Integer = 0 to lbClassTemplate.ListCount - 1
		    var tvTag as Variant = lbClassTemplate.RowTag(ti)
		    if tvTag.IsNumeric then
		      tbAlternate = not tbAlternate
		      
		    end
		    
		    marbAlternateColors.Append(tbAlternate)
		    
		  next ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReloadSection(teReloadType as ARProject.CustomizationTemplate.BlockType)
		  for ti as Integer = (lbClassTemplate.ListCount - 1) downto 0
		    var tvTag as Variant = lbClassTemplate.RowTag(ti)
		    if not tvTag.IsNumeric then continue for ti
		    
		    var teSection as ARProject.CustomizationTemplate.BlockType = lbClassTemplate.RowTag(ti)
		    if teSection <> teReloadType then continue for ti
		    if lbClassTemplate.Expanded(ti) = false then continue for ti
		    
		    ClearSection(ti)
		    
		    select case teSection
		    case ARProject.CustomizationTemplate.BlockType.Constant
		      LoadConstants(ti)
		      
		    case ARProject.CustomizationTemplate.BlockType.EventDefinition
		      LoadEvents(ti)
		      
		    case ARProject.CustomizationTemplate.BlockType.ClassMethod
		      LoadMethods(ti, false)
		      
		    case ARProject.CustomizationTemplate.BlockType.ClassProperty
		      LoadProperties(ti, false)
		      
		    case ARProject.CustomizationTemplate.BlockType.SharedMethod
		      LoadMethods(ti, true)
		      
		    case ARProject.CustomizationTemplate.BlockType.SharedProperty
		      LoadProperties(ti, true)
		      
		    end select
		    
		  next ti
		  
		  RecolorClassList
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RestoreFolderStates()
		  lbClassTemplate.Enabled = false
		  
		  for ti as Integer = lbClassTemplate.ListCount - 1 downto 0
		    var tvTag as Variant = lbClassTemplate.RowTag(ti)
		    if not tvTag.IsNumeric then continue for ti
		    
		    var teTag as ARProject.CustomizationTemplate.BlockType = ARProject.CustomizationTemplate.BlockType(tvTag.IntegerValue)
		    select case teTag
		    case ARProject.CustomizationTemplate.BlockType.Constant
		      lbClassTemplate.Expanded(ti) = moProject.DataClass.CustomTemplate.bExpandedConstants
		      
		    case ARProject.CustomizationTemplate.BlockType.EventDefinition
		      lbClassTemplate.Expanded(ti) = moProject.DataClass.CustomTemplate.bExpandedEvents
		      
		    case ARProject.CustomizationTemplate.BlockType.ClassMethod
		      lbClassTemplate.Expanded(ti) = moProject.DataClass.CustomTemplate.bExpandedMethods
		      
		    case ARProject.CustomizationTemplate.BlockType.ClassProperty
		      lbClassTemplate.Expanded(ti) = moProject.DataClass.CustomTemplate.bExpandedProperties
		      
		    case ARProject.CustomizationTemplate.BlockType.SharedMethod
		      lbClassTemplate.Expanded(ti) = moProject.DataClass.CustomTemplate.bExpandedSharedMethods
		      
		    case ARProject.CustomizationTemplate.BlockType.SharedProperty
		      lbClassTemplate.Expanded(ti) = moProject.DataClass.CustomTemplate.bExpandedSharedProperties
		      
		    end select
		    
		  next ti
		  
		  lbClassTemplate.Enabled = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetEnabledState()
		  // No selection
		  if lbClassTemplate.ListIndex < 0 then
		    ctlAddDel.DeleteEnabled = false
		    return
		    
		  end
		  
		  var tvSelection as Variant = lbClassTemplate.RowTag(lbClassTemplate.ListIndex)
		  
		  // Heading selected
		  if tvSelection.IsNumeric then
		    ctlAddDel.DeleteEnabled = false
		    
		  end
		  
		  // Cutsomization item selected
		  if  tvSelection isa ARProject.CustomizationConstant or _
		    tvSelection isa ARProject.CustomizationEvent or _
		    tvSelection isa ARProject.CustomizationMethod or _
		    tvSelection isa ARProject.CustomizationProperty then
		    ctlAddDel.DeleteEnabled = true
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetFolderStates()
		  if lbClassTemplate.Enabled = false then return
		  
		  for ti as Integer = 0 to lbClassTemplate.ListCount - 1
		    var tvTag as Variant = lbClassTemplate.RowTag(ti)
		    if not tvTag.IsNumeric then continue for ti
		    
		    var teTag as ARProject.CustomizationTemplate.BlockType = ARProject.CustomizationTemplate.BlockType(tvTag.IntegerValue)
		    select case teTag
		    case ARProject.CustomizationTemplate.BlockType.Constant
		      moProject.DataClass.CustomTemplate.bExpandedConstants = lbClassTemplate.Expanded(ti)
		      
		    case ARProject.CustomizationTemplate.BlockType.EventDefinition
		      moProject.DataClass.CustomTemplate.bExpandedEvents = lbClassTemplate.Expanded(ti)
		      
		    case ARProject.CustomizationTemplate.BlockType.ClassMethod
		      moProject.DataClass.CustomTemplate.bExpandedMethods = lbClassTemplate.Expanded(ti)
		      
		    case ARProject.CustomizationTemplate.BlockType.ClassProperty
		      moProject.DataClass.CustomTemplate.bExpandedProperties = lbClassTemplate.Expanded(ti)
		      
		    case ARProject.CustomizationTemplate.BlockType.SharedMethod
		      moProject.DataClass.CustomTemplate.bExpandedSharedMethods = lbClassTemplate.Expanded(ti)
		      
		    case ARProject.CustomizationTemplate.BlockType.SharedProperty
		      moProject.DataClass.CustomTemplate.bExpandedSharedProperties = lbClassTemplate.Expanded(ti)
		      
		    end select
		    
		  next ti
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private marbAlternateColors() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moProject As DataFile.t_Project
	#tag EndProperty


#tag EndWindowCode

#tag Events lbClassTemplate
	#tag Event
		Sub ExpandRow(row As Integer)
		  var teSection as ARProject.CustomizationTemplate.BlockType = me.RowTag(row)
		  select case teSection
		  case ARProject.CustomizationTemplate.BlockType.Constant
		    LoadConstants(row)
		    
		  case ARProject.CustomizationTemplate.BlockType.EventDefinition
		    LoadEvents(row)
		    
		  case ARProject.CustomizationTemplate.BlockType.ClassMethod
		    LoadMethods(row, false)
		    
		  case ARProject.CustomizationTemplate.BlockType.ClassProperty
		    LoadProperties(row, false)
		    
		  case ARProject.CustomizationTemplate.BlockType.SharedMethod
		    LoadMethods(row, true)
		    
		  case ARProject.CustomizationTemplate.BlockType.SharedProperty
		    LoadProperties(row, true)
		    
		  end select
		  
		  RecolorClassList
		  SetFolderStates
		End Sub
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if hitItem = nil then return false
		  if not (hitItem isa clsCustomizationMenu) then return false
		  
		  var toAction as clsCustomizationMenu = clsCustomizationMenu(hitItem)
		  
		  select case toAction.eAction
		  case clsCustomizationMenu.ActionType.DeleteBlock
		    // Delete passed item
		    var tvTag as Variant = hitItem.Tag
		    HandleDeleteTag(tvTag)
		    
		  case clsCustomizationMenu.ActionType.AddConstant
		    AddConstant
		    
		  case clsCustomizationMenu.ActionType.AddEvent
		    AddEvent
		    
		  case clsCustomizationMenu.ActionType.AddMethod
		    AddMethod(false)
		    
		  case clsCustomizationMenu.ActionType.AddProperty
		    AddProperty(false)
		    
		  case clsCustomizationMenu.ActionType.AddSharedMethod
		    AddMethod(true)
		    
		  case clsCustomizationMenu.ActionType.AddSharedProperty
		    AddProperty(true)
		    
		  end select
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma unused x
		  #pragma unused y
		  
		  // Delete
		  var toDelete as new clsCustomizationMenu("Delete")
		  toDelete.eAction = clsCustomizationMenu.ActionType.DeleteBlock
		  toDelete.Enabled = false
		  
		  var tiTargetRow as Integer = me.RowFromXY(x, y)
		  if tiTargetRow > -1 then
		    // Get item to delete
		    var tvTag as Variant = me.RowTag(tiTargetRow)
		    if not tvTag.IsNumeric then
		      toDelete.Tag = tvTag
		      toDelete.Enabled = true
		      
		    end
		    
		  end
		  
		  // Add Constant
		  var toAddConst as new clsCustomizationMenu("Add Constant")
		  toAddConst.eAction = clsCustomizationMenu.ActionType.AddConstant
		  
		  // Add Event Definition
		  var toAddEvent as new clsCustomizationMenu("Add Event Definition")
		  toAddEvent.eAction = clsCustomizationMenu.ActionType.AddEvent
		  
		  // Add Method
		  var toAddMethod as new clsCustomizationMenu("Add Method")
		  toAddMethod.eAction = clsCustomizationMenu.ActionType.AddMethod
		  
		  // Add Property
		  var toAddProp as new clsCustomizationMenu("Add Property")
		  toAddProp.eAction = clsCustomizationMenu.ActionType.AddProperty
		  
		  // Add Shared Method
		  var toAddSharedMethod as new clsCustomizationMenu("Add Shared Method")
		  toAddSharedMethod.eAction = clsCustomizationMenu.ActionType.AddSharedMethod
		  
		  // Add Shared Property
		  var toAddSharedProperty as new clsCustomizationMenu("Add Shared Property")
		  toAddSharedProperty.eAction = clsCustomizationMenu.ActionType.AddSharedProperty
		  
		  // Build menu
		  base.Append(toDelete)
		  base.Append(new MenuItem(MenuItem.TextSeparator))
		  base.Append(toAddConst)
		  base.Append(toAddEvent)
		  base.Append(toAddMethod)
		  base.Append(toAddProp)
		  base.Append(toAddSharedMethod)
		  base.Append(toAddSharedProperty)
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  // No selection
		  if me.ListIndex < 0 then
		    ppEditor.Value = 0
		    return
		    
		  end
		  
		  var tvTag as Variant = me.RowTag(me.ListIndex)
		  
		  // Heading selected
		  if tvTag.IsNumeric then
		    ppEditor.Value = 0
		    return
		    
		  end
		  
		  select case true
		  case tvTag isa ARProject.CustomizationConstant
		    ctlEditConstant.Load(tvTag)
		    ppEditor.Value = 1
		    
		  case tvTag isa ARProject.CustomizationEvent
		    ctlEditEvent.Load(tvTag)
		    ppEditor.Value = 2
		    
		  case tvTag isa ARProject.CustomizationMethod
		    ctlEditMethod.Load(tvTag)
		    ppEditor.Value = 3
		    
		  case tvTag isa ARProject.CustomizationProperty
		    ctlEditProperty.Load(tvTag)
		    ppEditor.Value = 4
		    
		  end select
		  
		  SetEnabledState
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #pragma unused column
		  
		  if row >= me.ListCount then return false
		  
		  // Allow system drawing on selected non-header rows
		  if me.Selected(row) = true then return false
		  
		  if marbAlternateColors(row) = true then
		    g.ForeColor = &cf0f6fd
		    
		    if IsDarkMode then
		      g.ForeColor = &c1C1C1C
		      
		      if NSWorkspaceMBS.accessibilityDisplayShouldIncreaseContrast then
		        g.ForeColor = &c272727
		        
		      end
		      
		    end
		    
		    g.FillRect(0, 0, g.Width, g.Height)
		    
		    return true
		    
		  end
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub CollapseRow(row As Integer)
		  #pragma unused row
		  RecolorClassList
		  SetFolderStates
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma unused g
		  #pragma unused x
		  #pragma unused y
		  
		  if column = 0 then
		    var tsValue as String = me.Cell(row, column)
		    var tvTag as Variant = me.RowTag(row)
		    select case true
		    case tvTag isa ARProject.CustomizationConstant
		      if ARProject.CustomizationConstant(tvTag).sName <> tsValue then
		        me.Cell(row, column) = ARProject.CustomizationConstant(tvTag).sName
		        
		      end
		      
		    case tvTag isa ARProject.CustomizationEvent
		      if ARProject.CustomizationEvent(tvTag).sName <> tsValue then
		        me.Cell(row, column) = ARProject.CustomizationEvent(tvTag).sName
		        
		      end
		      
		    case tvTag isa ARProject.CustomizationMethod
		      if ARProject.CustomizationMethod(tvTag).sName <> tsValue then
		        me.Cell(row, column) = ARProject.CustomizationMethod(tvTag).sName
		        
		      end
		      
		    case tvTag isa ARProject.CustomizationProperty
		      if ARProject.CustomizationProperty(tvTag).sName <> tsValue then
		        me.Cell(row, column) = ARProject.CustomizationProperty(tvTag).sName
		        
		      end
		      
		    end select
		    
		  end
		End Function
	#tag EndEvent
	#tag Event
		Function HeaderPressed(column as Integer) As Boolean
		  #pragma unused column
		  
		  me.HasHeading = false
		  me.ColumnSortDirection(column) = Listbox.SortNone
		  me.SortedColumn = -1
		  me.HasHeading = true
		  
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events lblHelp
	#tag Event
		Sub Action()
		  try
		    SpecialFolder.Resources.Child("Help Book").Child("using-argen").Child("customize-template").Child("index.html").Launch
		    
		  catch e as NilObjectException
		    MsgBox("Help Not Found")
		    
		  end try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlAddDel
	#tag Event
		Sub ClickedAdd()
		  // Get the type to add
		  var toSelector as new winBlockType
		  toSelector.ShowModalWithin(self.TrueWindow)
		  
		  select case toSelector.eType
		  case ARProject.CustomizationTemplate.BlockType.Constant
		    AddConstant
		    
		  case ARProject.CustomizationTemplate.BlockType.EventDefinition
		    AddEvent
		    
		  case ARProject.CustomizationTemplate.BlockType.ClassMethod
		    AddMethod(false)
		    
		  case ARProject.CustomizationTemplate.BlockType.ClassProperty
		    AddProperty(false)
		    
		  case ARProject.CustomizationTemplate.BlockType.SharedMethod
		    AddMethod(true)
		    
		  case ARProject.CustomizationTemplate.BlockType.SharedProperty
		    AddProperty(true)
		    
		  end select
		End Sub
	#tag EndEvent
	#tag Event
		Sub ClickedRemove()
		  HandleDelete
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlSplitter
	#tag Event
		Sub Open()
		  me.AddControl(lbClassTemplate, true)
		  me.AddControl(ppEditor, false)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlEditConstant
	#tag Event
		Sub NameChanged()
		  InvalidateRow
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlEditEvent
	#tag Event
		Sub NameChanged()
		  InvalidateRow
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlEditMethod
	#tag Event
		Sub NameChanged()
		  InvalidateRow
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlEditProperty
	#tag Event
		Sub NameChanged()
		  InvalidateRow
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
