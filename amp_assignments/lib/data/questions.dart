class Questions {
  static List<String> questions = [
    """Write a program to create a drawer with following details:
  - The header should display your picture inside a circular frame. (Hint: Use
  CircleAvatar widget).
  - The header should also display your student id below your picture.
  - Drawer contents: (Use appropriate icon for each item.)
  I. Interest calculator
  II. MinMax
  III. Order Food
  IV. Exit""",
    """
Filename must be: interest.dart 
Create a screen which takes principle, rate of interest and term in years as input. Clicking 
“Show Interest” button should display simple interest. Clicking “Reset” button should empty 
all the textboxes. 
    """,
    """
Filename must be: minmax.dart 
Create a screen which takes three numbers as input. Clicking “Show Max” button should 
display maximum number. Clicking “Min” button should minimum number. 
""",
    """
Filename must be: orderfood.dart 
Create a screen which shows four checkboxes for the following options:  
 Select All 
 Pizza (Rs. 250) 
 French Fries (Rs. 80) 
 Colddrink (Rs. 50) 
Clicking on Select All should select remaining three checkboxes. If Select All is already 
selected, clicking again on it should deselect all the three checkboxes. 
Use two Text widgets. One Text should display all the selected items. The other should 
display total price. As and when an item is selected or deselected, the list of items and total 
price should be updated instantly. 
""",
    """
Modify program # 1, use routes and navigation and clicking on a drawer item should display 
the correct target screen. i.e.  
If Interest Calculator is selected, load screen from interest.dart.   
If MinMax is selected, load screen from minmax.dart.   
If Order Food is selected, load screen from orderfood.dart.
""",
    """
Write a program to create two tabs with different background colors. First tab should display 
three images with the help of a Row widget and the second tab should display three images 
with the help of Column widget. 
""",
    """
Write a program to create an app with four screens. Each screen must have three buttons 
to re-direct to one of the three other screens. Use named routes. 
""",
    """
Create a scrollable dynamic list of 25 items with the help of ListView and builder() method.
""",
    """
Write a program to display at least four images-each of different type such as JPEG, PNG, GIF 
etc. Also display an image available on Internet using its URL. 
""",
    """
Create an app with three screens: 
login.dart : Take username and password as input. Clicking Login button should check if both 
username and password are admin. If so, re-direct to welcome screen (welcome.dart). 
Otherwise re-direct to error screen (errormsg.dart). Error message’s screen should also 
display a button “Try again”, clicking which should re-direct to  login screen. 
""",
    """
Modify program # 4. Instead of Select All checkbox, use two radiobuttons with labels “Select 
All” and “Select None”. Clicking a particular radiobutton should select or deselect all the 
checkboxes.
""",
"""
Take four checkboxes with following labels:  
 Hall 
 Kitchen 
 Bedroom 
 Lobby 
Take four bulb icons. i.e. one each for part of the house. 
Selecting a particular checkbox should change the bulb color to yellow. Deselecting the same 
checkbox should change the bulb color from yellow to gray. Each checkbox should control 
any one particular bulb icon. 
""",
"""
Modify program # 1. Add one more option “Light On-OFF” to the drawer before exit.  
"""
  ];
}
