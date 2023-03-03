=================================
salt-wrapper administrator manual
=================================

***************
Problems solved
***************

Run multiple Salt masters on one server
=======================================

You want to maintain several Salt masters from an unique server,
for example to target different projects.

This can be useful to kickstart the Salt configuration for a new project,
before you dedicate a standalone instance for this project master.

This configuration, if not well documented on Salt, is possible:
you can have several etc salt configuration directories, and pass
the right one to your salt commands using ``--config-dir`` argument.

We offer a ``salt-get-config-dir`` command to map working directories
(generally a clone of a repository containing your Salt states)
and a Salt configuration directory to pass to the ``--config-dir`` argument.

The map between working directories and configuration directories is stored
as a JSON document in ``/usr/local/etc/salt-wrapper.conf``.

Wrapper to invoke salt commands
===============================

The ``salt-wrapper`` command allows to call a Salt command as the right user,
with the right configuration directory parameter.

Use sudo capabilities
---------------------
If you've an operations or deployment group, it's convenient to allow through
sudo capability the group users to run salt commands as ``salt`` user.

There is one exception: if you need to run ``salt-call --local`` to provision
your salt master, this should be run as root.

Instead to need to write or alias something like ``sudo -u salt salt ...``,
the wrapper takes care to prepend the salt command with the right sudo.

Allow to avoid configuration parameters
---------------------------------------

The wrapper takes cake to call ``salt-get-config-dir`` and to pass the
result to the ``--config-dir`` argument.

************
Installation
************

OS 
==

UNIX-like OS
------------
Currently, the wrapper targets POSIX operating systems.

This software has been tested on FreeBSD 11.

Not intended for Windows
------------------------

The ``salt-get-config-dir`` command will work on Windows
inside a Cygwin environment, but a dedicated wrapper using
``runas`` should be written.

Manual installation
===================

Dependencies
------------

salt-wrapper requires the following software:
  - Python 3
  - sudo

Procedure
---------

#. Clone the repository or unpack a release archive
#. Run ``make install``

Upgrade
-------

#. Unpack a new release archive or use ``git pull`` to update the repository
#. Run ``make deinstall install``

Deinstall
---------

#. Go to the source code folder
#. Run ``make deinstall``

Configuration file
==================

The salt-wrapper configuration is written in JSON in the
``/usr/local/etc/salt-wrapper.conf`` file.

If you wish to store the configuration file elsewhere,
define the ``SALT_WRAPPER_CONF`` environment variable
to the path to the configuration file.

Here a sample:

.. code-block:: json
   :caption: /usr/local/etc/salt-wrapper.conf
   :name: salt-wrapper-conf

    {
        "roots": [
            {
                "config": "/usr/local/etc/salt-woodscloud",
                "states": "/opt/woodscloud-operations"
            },
            {
                "config": "/usr/local/etc/salt",
                "states": "/opt/nasqueron-operations"
            }
        ]
    }

The ``roots`` array is a map of config and states directories:
  - the ``config`` directory is the Salt one, containing your ``master`` file.
  - the ``states`` directory is the one where your top.sls file exists.

.. _shell-aliases:

Shell aliases
=============

tcsh
----

You add to your ``.cshrc`` file the following aliases:

.. code-block:: tcsh

   alias salt 'salt-wrapper salt'
   alias salt-call 'salt-wrapper salt-call'
   alias salt-cloud 'salt-wrapper salt-cloud'
   alias salt-key 'salt-wrapper salt-key'
   alias salt-run 'salt-wrapper salt-run'
   alias salt-ssh 'salt-wrapper salt-ssh'

bash or zsh
-----------

You can add to your ``.profile``, ``.bashrc`` or ``.zshrc`` file the following aliases:

.. code-block:: bash

   alias salt='salt-wrapper salt'
   alias salt-call='salt-wrapper salt-call'
   alias salt-cloud='salt-wrapper salt-cloud'
   alias salt-key='salt-wrapper salt-key'
   alias salt-run='salt-wrapper salt-run'
   alias salt-ssh='salt-wrapper salt-ssh'

.. _sudo:

Sudo configuration
==================

In your /etc/sudoers.d directory (or directly in your /etc/sudoers,
you can provide rules to allow a dedicated operations or deployment
group to run salt as the salt user.

Here a sample for FreeBSD:

.. code-block:: none
   :caption: /usr/local/etc/sudoers.d/salt
   :name: sudo-for-salt

   Cmnd_Alias SALT = /usr/local/bin/salt, /usr/local/bin/salt-api, /usr/local/bin/salt-call, /usr/local/bin/salt-cloud, /usr/local/bin/salt-cp, /usr/local/bin/salt-key, /usr/local/bin/salt-master, /usr/local/bin/salt-minion, /usr/local/bin/salt-proxy, /usr/local/bin/salt-run, /usr/local/bin/salt-ssh, /usr/local/bin/salt-syndic, /usr/local/etc/rc.d/salt_master

   %salt ALL=(salt) NOPASSWD: SALT
   %salt ALL=(ALL) NOPASSWD: /usr/local/bin/salt-call

Here a sample for Linux:

.. code-block:: none
   :caption: /etc/sudoers.d/salt
   :name: sudo-for-salt-linux

   Cmnd_Alias SALT = /usr/bin/salt, /usr/bin/salt-api, /usr/bin/salt-call, /usr/bin/salt-cloud, /usr/bin/salt-cp, /usr/bin/salt-key, /usr/bin/salt-master, /usr/bin/salt-minion, /usr/bin/salt-proxy, /usr/bin/salt-run, /usr/bin/salt-ssh, /usr/bin/salt-syndic, /usr/local/etc/rc.d/salt_master

   %salt ALL=(salt) NOPASSWD: SALT
   %salt ALL=(ALL) NOPASSWD: /usr/bin/salt-call

The last line allows to run ``salt-call`` as root, to be able to run
``salt-call --local`` to provision the master. That implies you give
root access to group, as they can run through Salt anything they want
as root.
