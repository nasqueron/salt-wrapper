# salt-wrapper

salt-wrapper has been built to solve two problems:

  - Run multiple Salt masters on one server and call correctly the good one
  - Provide easy to configure shell aliases to handle details like sudo

It provides two commands:
   - `salt-get-config-dir`: get the correct /etc Salt master directory according the path you're now
   - `salt-wrapper`: a shell script to call `sudo -u ... <salt command> --config-dir=<that directory>`

## Installation from source

```
$ git clone https://devcentral.nasqueron.org/source/salt-wrapper.git
$ cd salt-wrapper
$ make install
```
   
## Documentation

Installation and how to use instructions are available at:
https://docs.nasqueron.org/salt-wrapper/

## Contribute

Want to contribute? Great!

Check https://agora.nasqueron.org/How_to_contribute_code
if you wish to send your code to our code review system.

You can also open a pull request on GitHub.

## Known limitations

The wrapper focus on the immediate needs of their users,
following the YAGNI principle. As such, the following features
have been considered during deven't been implemented:

  - Ability to customize `salt` user
  - Windows support of `runas` instead of `sudo`

If you need such feature, feel free to open a task.

## License
  
Code is licensed under BSD-2-Clause.
