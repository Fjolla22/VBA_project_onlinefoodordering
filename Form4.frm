VERSION 5.00
Begin VB.Form Form4 
   Caption         =   "Form4"
   ClientHeight    =   7830
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   7785
   LinkTopic       =   "Form4"
   ScaleHeight     =   7830
   ScaleWidth      =   7785
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   2880
      TabIndex        =   5
      Top             =   600
      Width           =   2295
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   2760
      TabIndex        =   4
      Top             =   1560
      Width           =   2295
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   2640
      TabIndex        =   3
      Top             =   2640
      Width           =   2415
   End
   Begin VB.TextBox Text4 
      Height          =   405
      Left            =   2640
      TabIndex        =   2
      Top             =   3840
      Width           =   2295
   End
   Begin VB.CommandButton Command1 
      Caption         =   "ok"
      Height          =   495
      Left            =   1920
      TabIndex        =   1
      Top             =   4800
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Nazad"
      Height          =   615
      Left            =   2040
      TabIndex        =   0
      Top             =   5640
      Width           =   1575
   End
   Begin VB.Label Label1 
      Caption         =   "ime na produkt"
      Height          =   615
      Left            =   360
      TabIndex        =   9
      Top             =   480
      Width           =   1695
   End
   Begin VB.Label Label2 
      Caption         =   "cena"
      Height          =   495
      Left            =   360
      TabIndex        =   8
      Top             =   1560
      Width           =   1575
   End
   Begin VB.Label Label3 
      Caption         =   "Broj na produkti"
      Height          =   855
      Left            =   480
      TabIndex        =   7
      Top             =   2520
      Width           =   1455
   End
   Begin VB.Label Label4 
      Caption         =   "Broj na cifri"
      Height          =   495
      Left            =   360
      TabIndex        =   6
      Top             =   3840
      Width           =   1215
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim record As Produkt
Private Sub Command1_Click()
If Text1.Text <> "" And Text2.Text <> "" And _
    Text3.Text <> "" And Text1.Text <> "" Then
    odgovor = MsgBox("Dali si siguren?", vbYesNo)
    If odgovor = vbYes Then
        record.Ime = Text1.Text
        record.Cena = Val(Text2.Text)
        record.BrNaProdukt = Val(Text3.Text)
        record.BrNaCifri = Val(Text4.Text)
        Open App.Path & "\produkt.dat" For _
            Random As #1 Len = Len(record)
            br = LOF(1) / Len(record)
            Put #1, br + 1, record
        Close #1
        Text1.Text = "": Text2.Text = ""
        Text3.Text = "": Text4.Text = ""
        Text1.SetFocus
    End If
Else
    MsgBox ("Vnesi gi site podatoci")
End If
End Sub

Private Sub Command2_Click()
Form4.Hide
Form5.Show
End Sub

