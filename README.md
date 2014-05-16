vim-autonumber
==============

Automatically switch through relative/absolute/no number mode based on the current editing context.

Basic Usage
-----------
Press `Ctrl+U` in command mode, the number display mode will rotate through

```
    Relative Number -> Absolute Number -> No Number
          <-----------------------------------|
```

And these modes you can see in command mode called 'Default mode'.

The display mode will switched to Alt Mode When you enter insert mode, or exit current window and enter other window.
Default modes has it's pair Alt mode. See following table.

```
    Default Mode | Relative | Absolute | No
    -------------+----------+----------+----
    Alt Mode     | Absolute | Absolute | No
```
