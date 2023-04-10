VERSION 5.00
Begin VB.Form Form5 
   Caption         =   "Form5"
   ClientHeight    =   7590
   ClientLeft      =   225
   ClientTop       =   870
   ClientWidth     =   8205
   LinkTopic       =   "Form5"
   ScaleHeight     =   7590
   ScaleWidth      =   8205
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List1 
      Height          =   3960
      Left            =   240
      TabIndex        =   1
      Top             =   1440
      Width           =   6735
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H8000000D&
      Caption         =   "nazad"
      Height          =   375
      Left            =   6480
      TabIndex        =   0
      Top             =   6600
      Width           =   735
   End
   Begin VB.Label Label1 
      Height          =   495
      Left            =   840
      TabIndex        =   2
      Top             =   720
      Width           =   5655
   End
   Begin VB.Menu mnuZapis 
      Caption         =   "Zapis"
      Begin VB.Menu mnuZapisiNovzapis 
         Caption         =   "Nov zapis"
      End
      Begin VB.Menu mnuZapisiIzbrisi 
         Caption         =   "Izbrisi"
      End
   End
   Begin VB.Menu mnuList 
      Caption         =   "List"
      Begin VB.Menu mnuListiSite 
         Caption         =   "Site"
      End
      Begin VB.Menu mnuListiPrebaraj 
         Caption         =   "Prebaraj"
      End
      Begin VB.Menu mnuListiSortirajPoIme 
         Caption         =   "Sortiraj so ime"
      End
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim record As Produkt
Dim record1 As Produkt
Dim minrecord As Produkt
Dim redbr As Integer
Private Sub mnuIzlez_Click()
End
End Sub


Private Sub Command1_Click()
Form5.Hide
Form1.Show
End Sub

Private Sub mnuListiPrebaraj_Click()
Close
tekst = InputBox("Vnesi tekst za prebaruvanje")
Form1.Hide
Label1.Caption = "Lista na site produkti koi vo imeto go sodrzat " & UCase(Trim(tekst))
List1.Clear
Open App.Path & "\produkt.dat" For _
    Random As #1 Len = Len(record)
    br = LOF(1) / Len(record)
    j = 0
    For k = 1 To br
        Get #1, k, record
        If InStr(UCase(Trim(record.Ime)), UCase(Trim(tekst))) <> 0 Then
        j = j + 1
        izlez = j & ". " & record.Ime & _
        record.Cena & " den, " & _
        record.BrNaProdukt & " broj, " & _
        record.BrNaCifri & " broj na cifri"
        List1.AddItem izlez
        End If
    Next k
Close #1
End Sub

Private Sub mnuListiSite_Click()
Close
Form1.Hide
Label1.Caption = "Lista na site produkt"
List1.Clear
Open App.Path & "\produkt.dat" For _
    Random As #1 Len = Len(record)
    br = LOF(1) / Len(record)
    For k = 1 To br
        Get #1, k, record
        izlez = k & ". " & record.Ime & _
        record.Cena & " den, " & _
        record.BrNaProdukt & " broj, " & _
        record.BrNaCifri & " broj na cifri"
        List1.AddItem izlez
    Next k
Close #1
End Sub

Private Sub mnuListiSortirajPoIme_Click()
Close
Form1.Hide
Label1.Caption = "Lista na site produkt (sortirani po ime)"
List1.Clear
Open App.Path & "\produkt.dat" For Random _
    As #1 Len = Len(record)
Open App.Path & "\pomos.dat" For Random _
    As #2 Len = Len(record)
    br = LOF(1) / Len(record)
    For k = 1 To br
        Get #1, k, record
        Put #2, k, record
    Next k
Close
Open App.Path & "\pomos.dat" For Random _
    As #1 Len = Len(record)
    For k = 1 To br
        Get #1, k, record
        minime = Trim(LCase(record.Ime))
        minindex = k
        minrecord = record
        For j = k + 1 To br
            Get #1, j, record1
            If Trim(LCase(record1.Ime)) < minime Then
                minime = Trim(LCase(record1.Ime))
                minindex = j
                minrecord = record1
            End If
        Next j
        Put #1, k, minrecord
        Put #1, minindex, record
        izlez = k & ". " & minrecord.Ime & _
            minrecord.Cena & " den, " & _
            minrecord.BrNaProdukt & " broj, " & _
            minrecord.BrNaCifri & " broj na cifri "
        List1.AddItem izlez
    Next k
Close #1

End Sub

Private Sub mnuNajdiNajgusto_Click()
Close
Form1.Hide
Label1.Caption = "Najgusto zasadeno produkt"
List1.Clear
Open App.Path & "\produkt.dat" For _
    Random As #1 Len = Len(record)
    br = LOF(1) / Len(record)
    Get #1, 1, record
    Max = record.BrNaProdukt / record.Cena
    For k = 2 To br
        Get #1, k, record
        maxk = record.BrNaProdukt / record.Cena
        If maxk > Max Then
            Max = maxk
        End If
    Next k
    j = 0
    For k = 1 To br
        Get #1, k, record
        maxk = record.BrNaProdukt / record.Cena
        If maxk = Max Then
            j = j + 1
           izlez = j & ". " & record.Ime & _
        record.Cena & "den, " & _
        record.BrNaProdukt & " broj, " & _
        record.BrNaCifri & " broj na cifri"
            List1.AddItem izlez
        End If
    Next k
    List1.AddItem "Smetka: " & Max & "broj na den"
Close #1
End Sub

Private Sub mnuNajdiPrinos_Click()
Form1.Hide
Label1.Caption = "Produkti so najgolem broj na den"
List1.Clear
Open App.Path & "\produkt.dat" For _
    Random As #1 Len = Len(record)
    br = LOF(1) / Len(record)
    Get #1, 1, record
    Max = record.BrNaProdukt * record.BrNaCifri / record.Cena
    For k = 2 To br
        Get #1, k, record
        maxk = record.BrNaProdukt * record.BrNaCifri / record.Cena
        If maxk > Max Then
            Max = maxk
        End If
    Next k
    j = 0
    For k = 1 To br
        Get #1, k, record
        maxk = record.BrNaProdukt * record.BrNaCifri / record.Cena
        If maxk = Max Then
            j = j + 1
            izlez = j & ". " & record.Ime & _
        record.Cena & "den, " & _
        record.BrNaProdukt & " broj, " & _
        record.BrNaCifri & " broj na cifri"
            List1.AddItem izlez
        End If
    Next k
    List1.AddItem "Broj na cifri po den: " & Max & "broj na cifri/den"
Close #1
End Sub

Private Sub mnuZapisiIzbrisi_Click()
Close
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)
Close

m = Val(InputBox("koj prod. ke go otsranis"))

If m >= 1 And m <= br Then
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
   Open App.Path & "\pomos2.dat" For Random As #2 Len = Len(record)
   j = 0
   For k = 1 To br
      If k <> m Then
       Get #1, k, record
       j = j + 1
    Put #2, j, record
      End If
           Next k
Close #1
Close #2
Kill App.Path & "\produkt.dat"
Name App.Path & "\pomos2.dat" As App.Path & "\produkt.dat"
List1.Clear
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)
For k = 1 To br
Get #1, k, record
izlez = k & "." & Trim(record.Ime) & "     " & record.Cena
List1.AddItem izlez
Next k
Close #1
Else
MsgBox ("enter a number")
End If
Close
End Sub

Private Sub mnuZapisiNovzapis_Click()
Close
 Form4.Text1.Text = ""
Form4.Text2.Text = ""
Form4.Text3.Text = ""
Form4.Text4.Text = ""
Form4.Show
Form4.Text1.SetFocus


Form4.Text1.SetFocus
Open App.Path & "\produkt.dat" For Random As #1 Len = Len(record)
br = LOF(1) / Len(record)
record.Ime = Form4.Text1.Text
record.Cena = Val(Form4.Text2.Text)
record.BrNaProdukt = Val(Form4.Text3.Text)
record.BrNaCifri = Val(Form4.Text4.Text)
Put #1, br + 1, record
Close

End Sub


