# AutoLayoutDebugger

This category is used for autolayout debugging purposes.

1) Display view names, so it is easy for user to identify unsatisfied constraints.

2) Display whole view hierarchy, so user can detect ambigous layouts


HOW TO USE:
===========

1) Download this category and add this in your application.

2) If view is programmatically added, Then implementation will be
   
      self.view.viewIdentifier = @"DisplayName";

3) Otherwise define them in IB like this
     a)Select view
     b)Click user defined runtime attributes.
     c)Add new keypath, give  keypath ->viewIdentifier, type ->string, value->DisplayName

(This display name will be the name displayed during unsatisfied constraints, 
it is user specific).


NOTE:
=====
You should only use this code in your debug builds, don't ship it in an app because it 
accesses the private [NSLayoutConstraint asciiArtDescription] method.




