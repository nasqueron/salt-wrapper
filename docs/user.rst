========================
salt-wrapper user manual
========================

Purpose
=======

**salt-wrapper** allows you to run Salt command to target the correct
Salt configuration folder (for example if you've several Salt
masters on one server) and to prepend your command by sudo.

Configure shell aliases
=======================

See :ref:`shell-aliases` in the admin manual.

Run a salt command
==================

1. Go to the right folder containing your Salt states
2. Run from there (or any subdirectory) your Salt commands

The aliases configured in the previous section will take care
to run salt-wrapper <your command> instead.

If you don't want such alias, you can manually prepend your Salt
command by ``salt-wrapper``, it will works too.

Troubleshoot
============

Nothing happens
---------------

If you run a ``salt-wrapper`` command and nothing happens, check you aren't
outside a directory declared in ``/usr/local/etc/salt-wrapper.conf``
configuration file.

You can also check that through the exit code of the wrapper script:

.. code-block:: shell

  $ cd /tmp
  $ salt-wrapper salt-call
  $ echo $?
  1

I got a sudo prompt
-------------------

To use comfortably with seamless integration the wrapper,
you need to configure sudo to allow an ops group to run
commands as salt.

See :ref:`sudo` in the admin manual.

I need to disable something
---------------------------
The ``salt-wrapper`` development follows the YAGNI principle: to reduce
the cost of maintenance, we only implement features deemed necessary.

As such, in the initial release, there is no flag to enable of disable
features. If you've a root problem requiring such flag to disable a feature,
we'll be happy to add an option in ``salt-wrapper.conf`` or offer a workaround.
Just report an issue on our tracker.

Report issues
-------------

Issues can be reported at https://devcentral.nasqueron.org
