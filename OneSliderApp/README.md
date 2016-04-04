## UISlider jumps on the first touch issue
### How to fix the issue.
### set a thumbImage in the UISlider can be resolved the issue.
``
 [_mySlider setThumbImage:[UIImage imageNamed:@"pic.png"] forState:UIControlStateNormal];
``
