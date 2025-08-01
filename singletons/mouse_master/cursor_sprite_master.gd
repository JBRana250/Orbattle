extends Node

# When you need to change the cursor's sprite, simply emit these signals.
# The corresponding nodes will listen to these signals and change their default cursor shape accordingly.

signal cursor_to_arrow
signal cursor_to_point
signal cursor_to_drag
