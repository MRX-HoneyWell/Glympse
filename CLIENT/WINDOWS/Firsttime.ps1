
function button ($title,$name, $EmployeeID, $Designation,$Department) {

###################Load Assembly for creating form & button######
[void][System.Reflection.Assembly]::LoadWithPartialName( "System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName( "Microsoft.VisualBasic")

#####Define the form size & placement

$form = New-Object "System.Windows.Forms.Form";
$form.Width = 500;
$form.Height = 200;
$form.Text = $title;
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen;

##############Define text label1
$textLabel1 = New-Object "System.Windows.Forms.Label";
$textLabel1.Left = 25;
$textLabel1.Top = 15;

$textLabel1.Text = $name;

##############Define text label2

$textLabel2 = New-Object "System.Windows.Forms.Label";
$textLabel2.Left = 25;
$textLabel2.Top = 50;

$textLabel2.Text = $EmployeeID;

##############Define text label3

$textLabel3 = New-Object "System.Windows.Forms.Label";
$textLabel3.Left = 25;
$textLabel3.Top = 85;

$textLabel3.Text = $Designation;

#############Definbe text label4
$textLabel4 = New-Object "System.Windows.Forms.Label";
$textLabel4.Left = 25;
$textLabel4.Top = 120;

$textLabel4.Text = $Department;

############Define text box1 for input
$textBox1 = New-Object "System.Windows.Forms.TextBox";
$textBox1.Left = 150;
$textBox1.Top = 10;
$textBox1.width = 200;

############Define text box2 for input

$textBox2 = New-Object "System.Windows.Forms.TextBox";
$textBox2.Left = 150;
$textBox2.Top = 50;
$textBox2.width = 200;

############Define text box3 for input

$textBox3 = New-Object "System.Windows.Forms.TextBox";
$textBox3.Left = 150;
$textBox3.Top = 90;
$textBox3.width = 200;

############Define text box4 for input

$textBox4 = New-Object "System.Windows.Forms.TextBox";
$textBox4.Left = 150;
$textBox4.Top = 120;
$textBox4.width = 200;

#############Define default values for the input boxes
$defaultValue = ""
$textBox1.Text = $defaultValue;
$textBox2.Text = $defaultValue;
$textBox3.Text = $defaultValue;
$textBox4.Text = $defaultValue;

#############define OK button
$button = New-Object "System.Windows.Forms.Button";
$button.Left = 360;
$button.Top = 85;
$button.Width = 100;
$button.Text = "Submit";

############# This is when you have to close the form after getting values
$eventHandler = [System.EventHandler]{
$textBox1.Text;
$textBox2.Text;
$textBox3.Text;
$textBox4.Text;
$form.Close();};

$button.Add_Click($eventHandler) ;

#############Add controls to all the above objects defined
$form.Controls.Add($button);
$form.Controls.Add($textLabel1);
$form.Controls.Add($textLabel2);
$form.Controls.Add($textLabel3);
$form.Controls.Add($textLabel4);
$form.Controls.Add($textBox1);
$form.Controls.Add($textBox2);
$form.Controls.Add($textBox3);
$form.Controls.Add($textBox4);
$ret = $form.ShowDialog();

#################return values

return $textBox1.Text, $textBox2.Text, $textBox3.Text ,$textBox4.Text
}

$return= button "Honeywell" "Enter Name" "Employee ID" "Designation" "Department"

#Below variables will get the values that had been entered by the user

$return[0]
$return[1]
$return[2]
$return[3]
$SourceMAC=(Get-NetAdapter -Name 'Wi-Fi').MacAddress
$postParams=@{E_ID=$return[1];E_MAC=$SourceMAC;DESIGNATION=$return[2];E_NAME=$return[0];DEPARTMENT=$return[3]}

Invoke-WebRequest -Uri http://localhost/honeywell/Emplyee.php -Method POST -Body $postParams