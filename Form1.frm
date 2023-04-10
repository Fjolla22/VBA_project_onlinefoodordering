VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7905
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   10440
   LinkTopic       =   "Form1"
   ScaleHeight     =   7905
   ScaleWidth      =   10440
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      BackColor       =   &H008080FF&
      Caption         =   ">>>>"
      Height          =   495
      Left            =   3240
      MaskColor       =   &H00C0FFFF&
      TabIndex        =   8
      Top             =   6840
      Width           =   615
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Proizvodi"
      Height          =   495
      Left            =   7440
      TabIndex        =   7
      Top             =   360
      Width           =   1575
   End
   Begin VB.CommandButton Command5 
      Height          =   375
      Left            =   1920
      TabIndex        =   6
      Top             =   2040
      Width           =   1455
   End
   Begin VB.CommandButton Command6 
      Height          =   375
      Left            =   1920
      TabIndex        =   5
      Top             =   3000
      Width           =   1455
   End
   Begin VB.CommandButton Command7 
      Height          =   375
      Left            =   1920
      TabIndex        =   4
      Top             =   4080
      Width           =   1455
   End
   Begin VB.CommandButton Command8 
      Height          =   375
      Left            =   1920
      TabIndex        =   3
      Top             =   5160
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Kupuvaj"
      BeginProperty Font 
         Name            =   "Arial Rounded MT Bold"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   5760
      TabIndex        =   2
      Top             =   1920
      Width           =   2175
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Print"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   5760
      TabIndex        =   1
      Top             =   4560
      Width           =   2175
   End
   Begin VB.CommandButton Command9 
      Caption         =   "<<<<"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   6840
      Width           =   615
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   0
      X2              =   9000
      Y1              =   1320
      Y2              =   1320
   End
   Begin VB.Line Line2 
      BorderWidth     =   3
      X1              =   4200
      X2              =   4200
      Y1              =   1440
      Y2              =   7680
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Food"
      BeginProperty Font 
         Name            =   "Arial Rounded MT Bold"
         Size            =   26.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3480
      TabIndex        =   9
      Top             =   360
      Width           =   3135
   End
   Begin VB.Image Image1 
      Height          =   735
      Left            =   480
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   1095
   End
   Begin VB.Image Image2 
      Height          =   735
      Left            =   480
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   1095
   End
   Begin VB.Image Image3 
      Height          =   735
      Left            =   480
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   1095
   End
   Begin VB.Image Image4 
      Height          =   735
      Left            =   480
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim h As Integer
Dim record As Produkt
Dim i As Integer

Dim str As String
Dim izlez1 As String
Dim izlez2 As String
Dim izlez3 As String
Dim izlez4 As String


Private Sub Command1_Click()
MsgBox ("IZNOS = " & iznos & " den")
suma = Val(InputBox("Vo gotovo :"))
kusur = suma - iznos
MsgBox ("Za vrakanje" & kusur)
Form2.Label2 = "Total : " & iznos
Form2.Label6 = suma
Form2.Label7 = kusur
End Sub




Private Sub Command2_Click()
Form2.Label3.Caption = Date
smetka = smetka + 1
Form2.Label8.Caption = "Br na smetka : " & smetka
Form2.Show
iznos = 0
i = 0
izlez1 = ""
izlez2 = ""
izlez3 = ""
izlez4 = ""
str = ""
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)
i = 2
Get #1, 1, record
Command5.Caption = 1 & "." & " " & record.Ime
Get #1, 2, record
Command6.Caption = 2 & "." & " " & record.Ime
Get #1, 3, record
Command7.Caption = 3 & "." & " " & record.Ime
Get #1, 4, record
Command8.Caption = 4 & "." & " " & record.Ime
Close
End Sub

Private Sub Command3_Click()
Close
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)
If i <= br Then
Get #1, i, record
j = i
Command5.Caption = i & "." & " " & record.Ime
Get #1, i + 1, record
Command6.Caption = i + 1 & "." & " " & record.Ime
Get #1, i + 2, record
Command7.Caption = i + 2 & "." & " " & record.Ime
Get #1, i + 3, record
Command8.Caption = i + 3 & "." & " " & record.Ime
i = i + 4
Close
End If
End Sub

Private Sub Command4_Click()
Form5.Show
Form1.Hide
End Sub

Private Sub Command5_Click()
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)

str = Left(Command5.Caption, 1)
Number = Val(str)
Print Number
Get #1, Number, record
brojac = brojac + 1
100
BrNaProdukti = Val(InputBox("Vnesi Kolicina :"))
If BrNaProdukti = 0 Then
MsgBox ("vnesi broj na Produkti")
GoTo 100
End If
izlez1 = brojac & " " & Trim(record.Ime)
izlez2 = record.Cena & " Den "
izlez3 = " X " & BrNaProdukti
izlez4 = record.Cena * BrNaProdukti & " Den "
Form2.List1.AddItem izlez1
Form2.List2.AddItem izlez2
Form2.List3.AddItem izlez3
Form2.List4.AddItem izlez4
iznos = iznos + record.Cena * BrNaProdukti
BrNaProdukti = 0
izlez1 = ""
izlez2 = ""
izlez3 = ""
izlez4 = ""
str = ""


Close
End Sub

Private Sub Command6_Click()
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)
str = Left(Command6.Caption, 1)
Number = Val(str)

Print Number
Get #1, Number, record
brojac = brojac + 1
100
BrNaProdukti = Val(InputBox("Vnesi Kolicina :"))
If BrNaProdukti = 0 Then
MsgBox ("vnesi broj na Produkti")
GoTo 100
End If
izlez1 = brojac & " " & Trim(record.Ime)
izlez2 = record.Cena & " Den "
izlez3 = " X " & BrNaProdukti
izlez4 = record.Cena * BrNaProdukti & " Den "
Form2.List1.AddItem izlez1
Form2.List2.AddItem izlez2
Form2.List3.AddItem izlez3
Form2.List4.AddItem izlez4
iznos = iznos + record.Cena * BrNaProdukti
BrNaProdukti = 0
izlez1 = ""
izlez2 = ""
izlez3 = ""
izlez4 = ""
str = ""
Close
End Sub

Private Sub Command7_Click()

Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)
str = Left(Command7.Caption, 1)
Number = Val(str)
Print Number
Get #1, Number, record
brojac = brojac + 1
100
BrNaProdukti = Val(InputBox("Vnesi Kolicina :"))
If BrNaProdukti = 0 Then
MsgBox ("vnesi broj na Produkti")
GoTo 100
End If
izlez1 = brojac & " " & Trim(record.Ime)
izlez2 = record.Cena & " Den "
izlez3 = " X " & BrNaProdukti
izlez4 = record.Cena * BrNaProdukti & " Den "
Form2.List1.AddItem izlez1
Form2.List2.AddItem izlez2
Form2.List3.AddItem izlez3
Form2.List4.AddItem izlez4
iznos = iznos + record.Cena * BrNaProdukti
BrNaProdukti = 0
izlez1 = ""
izlez2 = ""
izlez3 = ""
izlez4 = ""
str = ""

Close
End Sub

Private Sub Command8_Click()
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)
str = Left(Command7.Caption, 1)
Number = Val(str)
Print Number
Get #1, Number, record
brojac = brojac + 1
100
BrNaProdukti = Val(InputBox("Vnesi Kolicina :"))
If BrNaProdukti = 0 Then
MsgBox ("vnesi broj na Produkti")
GoTo 100
End If
izlez1 = brojac & " " & Trim(record.Ime)
izlez2 = record.Cena & " Den "
izlez3 = " X " & BrNaProdukti
izlez4 = record.Cena * BrNaProdukti & " Den "
Form2.List1.AddItem izlez1
Form2.List2.AddItem izlez2
Form2.List3.AddItem izlez3
Form2.List4.AddItem izlez4
iznos = iznos + record.Cena * BrNaProdukti
BrNaProdukti = 0
izlez1 = ""
izlez2 = ""
izlez3 = ""
izlez4 = ""
str = ""

Close
End Sub

Private Sub Command9_Click()
Close
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)

Print i
  If i >= 1 Then
  
Get #1, i - 8, record
Command5.Caption = i - 8 & "." & " " & record.Ime
Get #1, i - 7, record
Command6.Caption = i - 7 & "." & " " & record.Ime
Get #1, i - 6, record
Command7.Caption = i - 6 & "." & " " & record.Ime
Get #1, i - 5, record
Command8.Caption = i - 5 & "." & " " & record.Ime
i = i - 5
Close
Else
Command9.Enabled = False
End If

End Sub

Private Sub Form_Load()
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)
i = 5
Get #1, 1, record
Command5.Caption = 1 & "." & " " & record.Ime
Get #1, 2, record
Command6.Caption = 2 & "." & " " & record.Ime
Get #1, 3, record
Command7.Caption = 3 & "." & " " & record.Ime
Get #1, 4, record
Command8.Caption = 4 & "." & " " & record.Ime

Close
End Sub

Private Sub Label3_Click()

End Sub

Private Sub Label4_Click()

End Sub

