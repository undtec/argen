#tag Class
Protected Class FieldInfo
	#tag Method, Flags = &h0
		Sub Constructor(sField as String, pi as Introspection.PropertyInfo)
		  self.sFieldName = sField
		  self.piFieldProperty = pi
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsKey() As Boolean
		  return (bForeignKey or bPrimaryKey)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDBType()
		  //First Get the Database Type
		  var ctx as BKS_ActiveRecord.P.Context = GetContext
		  var adp as BKS_ActiveRecord.DatabaseAdapter = ctx.ConnectionAdapter_Get(GetTypeInfo(BKS_ActiveRecord.Base))
		  
		  var db as database = adp.Db
		  
		  select case db
		  case nil
		    'empty. This just let's it compile if someone turns off all the constants
		    
		    
		    #if BKS_ActiveRecordConfig.kIncludeSQLiteDatabase and RBVersion>=2013
		  case isa SQLiteDatabase
		    select case enFieldType
		    case DbType.DInteger
		      iDbType = SQLitePreparedStatement.SQLITE_INTEGER
		    case DbType.DSmallInt
		      iDbType = SQLitePreparedStatement.SQLITE_INTEGER
		    case DbType.DDouble
		      iDbType = SQLitePreparedStatement.SQLITE_DOUBLE
		    case DbType.DDate
		      iDbType = SQLitePreparedStatement.SQLITE_TEXT
		    case DbType.DTime
		      iDbType = SQLitePreparedStatement.SQLITE_TEXT
		    case DbType.DTimestamp
		      iDbType = SQLitePreparedStatement.SQLITE_TEXT
		    case DbType.DBoolean
		      iDbType = SQLitePreparedStatement.SQLITE_BOOLEAN
		    case DbType.DBlob
		      iDbType = SQLitePreparedStatement.SQLITE_BLOB
		    case DbType.DText
		      iDbType = SQLitePreparedStatement.SQLITE_TEXT
		    case DbType.DInt64
		      iDbType = SQLitePreparedStatement.SQLITE_INT64
		    case DbType.DFloat
		      iDbType = SQLitePreparedStatement.SQLITE_DOUBLE
		    case dbType.dCurrency
		      iDbType = SQLitePreparedStatement.SQLITE_INT64
		    case else
		      break 'unsupported type
		    end select
		    #endif
		    
		    #if BKS_ActiveRecordConfig.kIncludeMySQLCommunityServer
		  case isa MySQLCommunityServer
		    select case enFieldType
		    case DbType.DInteger
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_LONG
		    case DbType.DSmallInt
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_SHORT
		    case DbType.DDouble
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_DOUBLE
		    case DbType.DDate
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_DATE
		    case DbType.DTime
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_TIME
		    case DbType.DTimestamp
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_TIMESTAMP
		    case DbType.DBoolean
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_TINY
		    case DbType.DBlob
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_BLOB
		    case DbType.DText
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_STRING
		    case DbType.DInt64
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_LONGLONG
		    case DbType.DFloat
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_DOUBLE
		    case dbType.dCurrency
		      iDbType = MySQLPreparedStatement.MYSQL_TYPE_LONGLONG
		    case else
		      break 'unsupported type
		    end select
		    #endif
		    
		    //Postgres doesn't use bind types.
		    
		    #if BKS_ActiveRecordConfig.kIncludeMSSQLServer
		  case isa MSSQLServerDatabase
		    select case enFieldType
		    case DbType.DInteger
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_BIGINT
		    case DbType.DSmallInt
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_SMALLINT
		    case DbType.DDouble
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_DOUBLE
		    case DbType.DDate
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_DATE
		    case DbType.DTime
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_TIME
		    case DbType.DTimestamp
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_DATETIME
		    case DbType.DBoolean
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_TINYINT
		    case DbType.DBlob
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_BINARY
		    case DbType.DText
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_STRING
		    case DbType.DInt64
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_BIGINT
		    case DbType.DFloat
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_FLOAT
		    case dbType.dCurrency
		      iDbType = MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_BIGINT
		    case else
		      break 'unsupported type
		    end select
		    #endif
		    
		    #if BKS_ActiveRecordConfig.kIncludeODBC
		  case isa ODBCDatabase
		    select case enFieldType
		    case DbType.DInteger
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_INTEGER
		    case DbType.DSmallInt
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_INTEGER
		    case DbType.DDouble
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_DOUBLE
		    case DbType.DDate
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_TIMESTAMP //Why Timestamp?  Testing shows that's the only thing works
		    case DbType.DTime
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_STRING
		    case DbType.DTimestamp
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_TIMESTAMP
		    case DbType.DBoolean
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_TINYINT
		    case DbType.DBlob
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_BINARY
		    case DbType.DText
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_STRING
		    case DbType.DInt64
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_BIGINT
		    case DbType.DFloat
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_FLOAT
		    case dbType.dCurrency
		      iDbType = ODBCPreparedStatement.ODBC_TYPE_BIGINT
		    case else
		      break 'unsupported type
		    end select
		    #endif
		    
		    
		    
		    
		    
		    #if BKS_ActiveRecordConfig.kIncludeCubeDatabase
		  case isa CubeSQLServer
		    select case enFieldType
		    case DbType.DInteger
		      iDbType = REALSQLPreparedStatement.SQLITE_INTEGER
		    case DbType.DSmallInt
		      iDbType = REALSQLPreparedStatement.SQLITE_INTEGER
		    case DbType.DDouble
		      iDbType = REALSQLPreparedStatement.SQLITE_DOUBLE
		    case DbType.DDate
		      iDbType = REALSQLPreparedStatement.SQLITE_TEXT
		    case DbType.DTime
		      iDbType = REALSQLPreparedStatement.SQLITE_TEXT
		    case DbType.DTimestamp
		      iDbType = REALSQLPreparedStatement.SQLITE_TEXT
		    case DbType.DBoolean
		      iDbType = REALSQLPreparedStatement.SQLITE_BOOLEAN
		    case DbType.DBlob
		      iDbType = REALSQLPreparedStatement.SQLITE_BLOB
		    case DbType.DText
		      iDbType = REALSQLPreparedStatement.SQLITE_TEXT
		    case DbType.DInt64
		      iDbType = REALSQLPreparedStatement.SQLITE_INT64
		    case DbType.DFloat
		      iDbType = REALSQLPreparedStatement.SQLITE_DOUBLE
		    case dbType.dCurrency
		      iDbType = REALSQLPreparedStatement.SQLITE_INT64
		    case else
		      break 'unsupported type
		    end select
		    #endif
		    
		    #if BKS_ActiveRecordConfig.kIncludeVSQLiteDatabase
		  case isa VSQLiteDatabase
		    select case enFieldType
		    case DbType.DInteger
		      iDbType = SQLitePreparedStatement.SQLITE_INTEGER
		    case DbType.DSmallInt
		      iDbType = SQLitePreparedStatement.SQLITE_INTEGER
		    case DbType.DDouble
		      iDbType = SQLitePreparedStatement.SQLITE_DOUBLE
		    case DbType.DDate
		      iDbType = SQLitePreparedStatement.SQLITE_TEXT
		    case DbType.DTime
		      iDbType = SQLitePreparedStatement.SQLITE_TEXT
		    case DbType.DTimestamp
		      iDbType = SQLitePreparedStatement.SQLITE_TEXT
		    case DbType.DBoolean
		      iDbType = SQLitePreparedStatement.SQLITE_BOOLEAN
		    case DbType.DBlob
		      iDbType = SQLitePreparedStatement.SQLITE_BLOB
		    case DbType.DText
		      iDbType = SQLitePreparedStatement.SQLITE_TEXT
		    case DbType.DInt64
		      iDbType = SQLitePreparedStatement.SQLITE_INT64
		    case DbType.DFloat
		      iDbType = SQLitePreparedStatement.SQLITE_DOUBLE
		    case else
		      break 'unsupported type
		    end select
		    #endif
		    
		    
		  end select
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bForeignKey As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bPrimaryKey As boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return menFieldType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  menFieldType = value
			  
			  SetDBType
			End Set
		#tag EndSetter
		enFieldType As BKS_ActiveRecord.DbType
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		iDbType As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private menFieldType As BKS_ActiveRecord.DbType
	#tag EndProperty

	#tag Property, Flags = &h0
		piFieldProperty As Introspection.PropertyInfo
	#tag EndProperty

	#tag Property, Flags = &h0
		sFieldName As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="bForeignKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bPrimaryKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="enFieldType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="BKS_ActiveRecord.DbType"
			EditorType="Enum"
			#tag EnumValues
				"0 - DInteger"
				"1 - DSmallInt"
				"2 - DDouble"
				"3 - DDate"
				"4 - DTime"
				"5 - DTimestamp"
				"6 - DBoolean"
				"7 - DBlob"
				"8 - DText"
				"9 - DInt64"
				"10 - DFloat"
				"11 - DCurrency"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="iDbType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
			Name="sFieldName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
End Class
#tag EndClass
